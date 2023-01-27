# Dimploma

### LSR делает хуже

Иногда LSR делает оптимизации, которые только ухудшают ситуацию. Например,
```cpp
#include <stddef.h>
size_t strlen5(const char *s)
{
    const char *s1 = s - 1;
    char c;
    do {
        c = *++s1;
    } while (c != 0);

	return (size_t)(s1 - s);
}
---------------------------------------------

entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

; Loop:
do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

; Exit blocks
do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
*** IR Dump After Loop Strength Reduction (loop-reduce) ***
; Preheader:
entry:
  br label %do.body

; Loop:
do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

; Exit blocks
do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
```

Фиксится с помощью **-mllvm -lsr-drop-solution** - как добавляли [ПАТЧ](https://reviews.llvm.org/D126043).

Хотели сделать эту опцию для RISCV по дефолту [ЗДЕСЬ](https://reviews.llvm.org/D136736), но проблема в регрессиях данной опции на разных видах архитектур (типо ARM, AArch, ...), поэтому договорились, что если уж и вставлять эту опцию, то для всех архитектур. Надо мне заниматься всеми 50-ю регрессиями... Вряд ли, лучше модернизировать сам LSR

[GODBOLT](https://godbolt.org/z/axze9he3r)

# Почему нельзя по дефолту?

Вообще данные по выигрышам просто отличные

```
Benchmark results of Spec2k6 on FPGA with our downstream
compiler under the patch applied show difference larger than
just fluctuation in the following benchmarks and little
difference for the others.

2.6% runtime improvement in perlbench
1.5% runtime improvement in hmmer
1.3% runtime regression in sjeng
```

Самый главный комментарий почему всё застопилось

```
    My main point is that I think we should try to avoid
    fragmentation between backends for generic features such as
    this one. Having this enabled by default and ironing out
    the remaining test issues will be much more beneficial for
    the overall LLVM project. By making sure is is enabled on
    heavily used architectures like X86 and AArch64 we also
    ensure that it gets as much testing as possible.

    IMO it may be fine to gradually enable it, but I think we
    first need to understand what the issues with the other
    tests are. My concern is that after only enabling it for
    RISCV it will remain enabled for RISCV only
```

### Folding RISCV

[ЗДЕСЬ](https://reviews.llvm.org/D134893#change-0w42q9r3UpbE) находится уже залитая возможность делать folding IV если у нас одна из них терминирующая, а вторая просто рядом плетётся. И вот мы хотим сложить две эти переменные в одну. Хотели сделать эту опцию для RISCV вообще по дефолту через TTI. Честно, не очень понимаю, почему застыло. Чувак вбросил хрень огромную и типо - регрессия. Какая... Его просят прислать что конкретно - игнор, мда...

Правда на моих тестах даже руками загнанная опция не помогает

Небольшое улучшение сделали совсем недавно [ЗДЕСЬ](https://reviews.llvm.org/D142240). Правда, тоже частные случаи лишь.

### Find if

```cpp
int* foo(int *__first, int* __last, int (*__pred)(int)) {
    int __trip_count = (__last - __first) >> 2;
    for (; __trip_count > 0; --__trip_count)
    {
      if (__pred(*__first))
        return __first;
      ++__first;
      if (__pred(*__first))
        return __first;
      ++__first;
      if (__pred(*__first))
        return __first;
      ++__first;
      if (__pred(*__first))
        return __first;
      ++__first;
    }
    return __last;
}
```

[GODBOLT](https://godbolt.org/z/jGGa83KK5)

Здесь проблема в том, что LSR делает опять хрень...

```cpp
///////FROM
for.body:                                         ; preds = %for.body.preheader, %if.end14
  %__trip_count.045 = phi i32 [ %dec, %if.end14 ], [ %conv, %for.body.preheader ]
  %__first.addr.044 = phi ptr [ %incdec.ptr15, %if.end14 ], [ %__first, %for.body.preheader ]
  %1 = load i32, ptr %__first.addr.044, align 4, !tbaa !6
  %call = tail call noundef signext i32 %__pred(i32 noundef signext %1)
  %tobool.not = icmp eq i32 %call, 0
  br i1 %tobool.not, label %if.end, label %cleanup.loopexit

///////TO
%for.body.preheader, %if.end14
  %lsr.iv68 = phi ptr [ %uglygep, %for.body.preheader ], [ %uglygep69, %if.end14 ]
  %lsr.iv = phi i32 [ %1, %for.body.preheader ], [ %lsr.iv.next, %if.end14 ]
  %uglygep74 = getelementptr i8, ptr %lsr.iv68, i64 -8
  %2 = load i32, ptr %uglygep74, align 4, !tbaa !6
  %call = tail call noundef signext i32 %__pred(i32 noundef signext %2)
  %tobool.not = icmp eq i32 %call, 0
  br i1 %tobool.not, label %if.end, label %for.body.cleanup.loopexit_crit_edge
```

Интересно, что призванный решить проблему LSR-DROP (смотри секцию 1) ничем не помогает, считает, что данная оптимизация приносит пользу и не отбрасывает её. Действительно, не зря этот патч как дефолт в RISCV не захотели включать!

Кажется, что просто выбор индукционной переменной внутри GEP'a решает почти все эти проблемы.

Поэтому надо разобраться, а как он решает что пора останавливаться смотреть вглубь инструкций и брать эту индукционную переменную...

# Пример Антона

[ЗДЕСЬ](https://godbolt.org/z/1rdjqn8hT) пример Антона. Проблема в тройном лишнем инкременте LBB0.2 Легко заметить с drop-solution, что можно свести к двум инкрементам, что уже неплохо. Но у GCC всего один инкрмент - неполадок...

У меня теперь файл **test_find_if.ll** на это есть!

Отражение тому, что мы видим в IR'е - это увеличение кол-ва phi узлов, то есть кол-ва IV. Если прокинуть опцию фолдинг - не помогает!

Теперь поймём, каким мы хотим для данного случая получить IR...
Ну понятно, эти два фи узла связаны - один __first, а другой (__end - __first) / 4, ну и компилятор нифига не видит связи. Нам надо, чтобы всё было связано только с first. И это кажется простым, всего один use у (__end - __first) / 4 при проверке выхода из цикла

Итог: проблема абсолютно не в GEP'е...

### Задуматься...

1) Отличная опция **-mllvm -disable-lsr**, однако
-lsr-drop-solution тоже считает, что надо не выполнять оптимизацию. Значит, формула ещё более менее нормально работает - [GODBOLT](https://godbolt.org/z/r1c7j9a7W).

### LITS

##### Section 1.
```cpp
// ../build/sc_release/bin/opt -loop-reduce -S test.ll

source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

; Loop:
do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body

; Exit blocks
do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
```

##### Section 3.

```cpp
// ../build/sc_release/bin/opt -loop-reduce -S test_find_if.ll

source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

define dso_local noundef ptr @_Z3fooPiS_PFiiE(ptr noundef %__first, ptr noundef %__last, ptr nocapture noundef readonly %__pred) {
entry:
  %sub.ptr.lhs.cast = ptrtoint ptr %__last to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %__first to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %0 = lshr i64 %sub.ptr.sub, 4
  %conv = trunc i64 %0 to i32
  %cmp43 = icmp sgt i32 %conv, 0
  br i1 %cmp43, label %for.body.preheader, label %cleanup

for.body.preheader:                               ; preds = %entry
  br label %for.body

; Loop:
for.body:                                         ; preds = %for.body.preheader, %if.end14
  %__trip_count.045 = phi i32 [ %dec, %if.end14 ], [ %conv, %for.body.preheader ]
  %__first.addr.044 = phi ptr [ %incdec.ptr15, %if.end14 ], [ %__first, %for.body.preheader ]
  %1 = load i32, ptr %__first.addr.044, align 4
  %call = tail call noundef signext i32 %__pred(i32 noundef signext %1)
  %tobool.not = icmp eq i32 %call, 0
  br i1 %tobool.not, label %if.end, label %cleanup.loopexit

if.end:                                           ; preds = %for.body
  %incdec.ptr = getelementptr inbounds i32, ptr %__first.addr.044, i64 1
  %2 = load i32, ptr %incdec.ptr, align 4
  %call1 = tail call noundef signext i32 %__pred(i32 noundef signext %2)
  %tobool2.not = icmp eq i32 %call1, 0
  br i1 %tobool2.not, label %if.end4, label %cleanup.loopexit.split.loop.exit51

if.end4:                                          ; preds = %if.end
  %incdec.ptr5 = getelementptr inbounds i32, ptr %__first.addr.044, i64 2
  %3 = load i32, ptr %incdec.ptr5, align 4
  %call6 = tail call noundef signext i32 %__pred(i32 noundef signext %3)
  %tobool7.not = icmp eq i32 %call6, 0
  br i1 %tobool7.not, label %if.end9, label %cleanup.loopexit.split.loop.exit49

if.end9:                                          ; preds = %if.end4
  %incdec.ptr10 = getelementptr inbounds i32, ptr %__first.addr.044, i64 3
  %4 = load i32, ptr %incdec.ptr10, align 4
  %call11 = tail call noundef signext i32 %__pred(i32 noundef signext %4)
  %tobool12.not = icmp eq i32 %call11, 0
  br i1 %tobool12.not, label %if.end14, label %cleanup.loopexit.split.loop.exit

if.end14:                                         ; preds = %if.end9
  %incdec.ptr15 = getelementptr inbounds i32, ptr %__first.addr.044, i64 4
  %dec = add nsw i32 %__trip_count.045, -1
  %cmp = icmp sgt i32 %__trip_count.045, 1
  br i1 %cmp, label %for.body, label %cleanup.loopexit

cleanup.loopexit.split.loop.exit51:               ; preds = %if.end
  %incdec.ptr.le = getelementptr inbounds i32, ptr %__first.addr.044, i64 1
  br label %cleanup

cleanup.loopexit.split.loop.exit49:               ; preds = %if.end4
  %incdec.ptr5.le = getelementptr inbounds i32, ptr %__first.addr.044, i64 2
  br label %cleanup

cleanup.loopexit.split.loop.exit:                 ; preds = %if.end9
  %incdec.ptr10.le = getelementptr inbounds i32, ptr %__first.addr.044, i64 3
  br label %cleanup

cleanup.loopexit:                                 ; preds = %for.body, %if.end14
  %retval.0.ph = phi ptr [ %__first.addr.044, %for.body ], [ %__last, %if.end14 ]
  br label %cleanup

cleanup:                                          ; preds = %cleanup.loopexit, %cleanup.loopexit.split.loop.exit, %cleanup.loopexit.split.loop.exit49, %cleanup.loopexit.split.loop.exit51, %entry
  %retval.0 = phi ptr [ %__last, %entry ], [ %incdec.ptr10.le, %cleanup.loopexit.split.loop.exit ], [ %incdec.ptr5.le, %cleanup.loopexit.split.loop.exit49 ], [ %incdec.ptr.le, %cleanup.loopexit.split.loop.exit51 ], [ %retval.0.ph, %cleanup.loopexit ]
  ret ptr %retval.0
}
```

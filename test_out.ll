; ModuleID = 'test.ll'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

define dso_local i64 @strlen5(ptr noundef %s) {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}

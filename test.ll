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

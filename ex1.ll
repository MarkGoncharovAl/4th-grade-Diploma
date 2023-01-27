*** IR Dump After Annotation2MetadataPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) #0 {
entry:
  %s.addr = alloca ptr, align 8
  %s1 = alloca ptr, align 8
  %c = alloca i8, align 1
  store ptr %s, ptr %s.addr, align 8, !tbaa !4
  call void @llvm.lifetime.start.p0(i64 8, ptr %s1) #2
  %0 = load ptr, ptr %s.addr, align 8, !tbaa !4
  %add.ptr = getelementptr inbounds i8, ptr %0, i64 -1
  store ptr %add.ptr, ptr %s1, align 8, !tbaa !4
  call void @llvm.lifetime.start.p0(i64 1, ptr %c) #2
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %1 = load ptr, ptr %s1, align 8, !tbaa !4
  %incdec.ptr = getelementptr inbounds i8, ptr %1, i32 1
  store ptr %incdec.ptr, ptr %s1, align 8, !tbaa !4
  %2 = load i8, ptr %incdec.ptr, align 1, !tbaa !8
  store i8 %2, ptr %c, align 1, !tbaa !8
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %3 = load i8, ptr %c, align 1, !tbaa !8
  %conv = zext i8 %3 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !9

do.end:                                           ; preds = %do.cond
  %4 = load ptr, ptr %s1, align 8, !tbaa !4
  %5 = load ptr, ptr %s.addr, align 8, !tbaa !4
  %sub.ptr.lhs.cast = ptrtoint ptr %4 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %5 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  call void @llvm.lifetime.end.p0(i64 1, ptr %c) #2
  call void @llvm.lifetime.end.p0(i64 8, ptr %s1) #2
  ret i64 %sub.ptr.sub
}

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }
attributes #1 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
*** IR Dump After ForceFunctionAttrsPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) #0 {
entry:
  %s.addr = alloca ptr, align 8
  %s1 = alloca ptr, align 8
  %c = alloca i8, align 1
  store ptr %s, ptr %s.addr, align 8, !tbaa !4
  call void @llvm.lifetime.start.p0(i64 8, ptr %s1) #2
  %0 = load ptr, ptr %s.addr, align 8, !tbaa !4
  %add.ptr = getelementptr inbounds i8, ptr %0, i64 -1
  store ptr %add.ptr, ptr %s1, align 8, !tbaa !4
  call void @llvm.lifetime.start.p0(i64 1, ptr %c) #2
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %1 = load ptr, ptr %s1, align 8, !tbaa !4
  %incdec.ptr = getelementptr inbounds i8, ptr %1, i32 1
  store ptr %incdec.ptr, ptr %s1, align 8, !tbaa !4
  %2 = load i8, ptr %incdec.ptr, align 1, !tbaa !8
  store i8 %2, ptr %c, align 1, !tbaa !8
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %3 = load i8, ptr %c, align 1, !tbaa !8
  %conv = zext i8 %3 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !9

do.end:                                           ; preds = %do.cond
  %4 = load ptr, ptr %s1, align 8, !tbaa !4
  %5 = load ptr, ptr %s.addr, align 8, !tbaa !4
  %sub.ptr.lhs.cast = ptrtoint ptr %4 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %5 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  call void @llvm.lifetime.end.p0(i64 1, ptr %c) #2
  call void @llvm.lifetime.end.p0(i64 8, ptr %s1) #2
  ret i64 %sub.ptr.sub
}

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }
attributes #1 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
*** IR Dump After InferFunctionAttrsPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) #0 {
entry:
  %s.addr = alloca ptr, align 8
  %s1 = alloca ptr, align 8
  %c = alloca i8, align 1
  store ptr %s, ptr %s.addr, align 8, !tbaa !4
  call void @llvm.lifetime.start.p0(i64 8, ptr %s1) #2
  %0 = load ptr, ptr %s.addr, align 8, !tbaa !4
  %add.ptr = getelementptr inbounds i8, ptr %0, i64 -1
  store ptr %add.ptr, ptr %s1, align 8, !tbaa !4
  call void @llvm.lifetime.start.p0(i64 1, ptr %c) #2
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %1 = load ptr, ptr %s1, align 8, !tbaa !4
  %incdec.ptr = getelementptr inbounds i8, ptr %1, i32 1
  store ptr %incdec.ptr, ptr %s1, align 8, !tbaa !4
  %2 = load i8, ptr %incdec.ptr, align 1, !tbaa !8
  store i8 %2, ptr %c, align 1, !tbaa !8
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %3 = load i8, ptr %c, align 1, !tbaa !8
  %conv = zext i8 %3 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !9

do.end:                                           ; preds = %do.cond
  %4 = load ptr, ptr %s1, align 8, !tbaa !4
  %5 = load ptr, ptr %s.addr, align 8, !tbaa !4
  %sub.ptr.lhs.cast = ptrtoint ptr %4 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %5 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  call void @llvm.lifetime.end.p0(i64 1, ptr %c) #2
  call void @llvm.lifetime.end.p0(i64 8, ptr %s1) #2
  ret i64 %sub.ptr.sub
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }
attributes #1 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
*** IR Dump After CoroEarlyPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) #0 {
entry:
  %s.addr = alloca ptr, align 8
  %s1 = alloca ptr, align 8
  %c = alloca i8, align 1
  store ptr %s, ptr %s.addr, align 8, !tbaa !4
  call void @llvm.lifetime.start.p0(i64 8, ptr %s1) #2
  %0 = load ptr, ptr %s.addr, align 8, !tbaa !4
  %add.ptr = getelementptr inbounds i8, ptr %0, i64 -1
  store ptr %add.ptr, ptr %s1, align 8, !tbaa !4
  call void @llvm.lifetime.start.p0(i64 1, ptr %c) #2
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %1 = load ptr, ptr %s1, align 8, !tbaa !4
  %incdec.ptr = getelementptr inbounds i8, ptr %1, i32 1
  store ptr %incdec.ptr, ptr %s1, align 8, !tbaa !4
  %2 = load i8, ptr %incdec.ptr, align 1, !tbaa !8
  store i8 %2, ptr %c, align 1, !tbaa !8
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %3 = load i8, ptr %c, align 1, !tbaa !8
  %conv = zext i8 %3 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !9

do.end:                                           ; preds = %do.cond
  %4 = load ptr, ptr %s1, align 8, !tbaa !4
  %5 = load ptr, ptr %s.addr, align 8, !tbaa !4
  %sub.ptr.lhs.cast = ptrtoint ptr %4 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %5 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  call void @llvm.lifetime.end.p0(i64 1, ptr %c) #2
  call void @llvm.lifetime.end.p0(i64 8, ptr %s1) #2
  ret i64 %sub.ptr.sub
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }
attributes #1 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
*** IR Dump After LowerExpectIntrinsicPass on strlen5 ***
; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) #0 {
entry:
  %s.addr = alloca ptr, align 8
  %s1 = alloca ptr, align 8
  %c = alloca i8, align 1
  store ptr %s, ptr %s.addr, align 8, !tbaa !4
  call void @llvm.lifetime.start.p0(i64 8, ptr %s1) #2
  %0 = load ptr, ptr %s.addr, align 8, !tbaa !4
  %add.ptr = getelementptr inbounds i8, ptr %0, i64 -1
  store ptr %add.ptr, ptr %s1, align 8, !tbaa !4
  call void @llvm.lifetime.start.p0(i64 1, ptr %c) #2
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %1 = load ptr, ptr %s1, align 8, !tbaa !4
  %incdec.ptr = getelementptr inbounds i8, ptr %1, i32 1
  store ptr %incdec.ptr, ptr %s1, align 8, !tbaa !4
  %2 = load i8, ptr %incdec.ptr, align 1, !tbaa !8
  store i8 %2, ptr %c, align 1, !tbaa !8
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %3 = load i8, ptr %c, align 1, !tbaa !8
  %conv = zext i8 %3 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !9

do.end:                                           ; preds = %do.cond
  %4 = load ptr, ptr %s1, align 8, !tbaa !4
  %5 = load ptr, ptr %s.addr, align 8, !tbaa !4
  %sub.ptr.lhs.cast = ptrtoint ptr %4 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %5 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  call void @llvm.lifetime.end.p0(i64 1, ptr %c) #2
  call void @llvm.lifetime.end.p0(i64 8, ptr %s1) #2
  ret i64 %sub.ptr.sub
}
*** IR Dump After SimplifyCFGPass on strlen5 ***
; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) #0 {
entry:
  %s.addr = alloca ptr, align 8
  %s1 = alloca ptr, align 8
  %c = alloca i8, align 1
  store ptr %s, ptr %s.addr, align 8, !tbaa !4
  call void @llvm.lifetime.start.p0(i64 8, ptr %s1) #2
  %0 = load ptr, ptr %s.addr, align 8, !tbaa !4
  %add.ptr = getelementptr inbounds i8, ptr %0, i64 -1
  store ptr %add.ptr, ptr %s1, align 8, !tbaa !4
  call void @llvm.lifetime.start.p0(i64 1, ptr %c) #2
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %1 = load ptr, ptr %s1, align 8, !tbaa !4
  %incdec.ptr = getelementptr inbounds i8, ptr %1, i32 1
  store ptr %incdec.ptr, ptr %s1, align 8, !tbaa !4
  %2 = load i8, ptr %incdec.ptr, align 1, !tbaa !8
  store i8 %2, ptr %c, align 1, !tbaa !8
  %3 = load i8, ptr %c, align 1, !tbaa !8
  %conv = zext i8 %3 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !9

do.end:                                           ; preds = %do.body
  %4 = load ptr, ptr %s1, align 8, !tbaa !4
  %5 = load ptr, ptr %s.addr, align 8, !tbaa !4
  %sub.ptr.lhs.cast = ptrtoint ptr %4 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %5 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  call void @llvm.lifetime.end.p0(i64 1, ptr %c) #2
  call void @llvm.lifetime.end.p0(i64 8, ptr %s1) #2
  ret i64 %sub.ptr.sub
}
*** IR Dump After SROAPass on strlen5 ***
; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i32 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %conv = zext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After EarlyCSEPass on strlen5 ***
; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i32 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %conv = zext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After CallSiteSplittingPass on strlen5 ***
; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i32 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %conv = zext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After OpenMPOptPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i32 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %conv = zext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }
attributes #1 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After IPSCCPPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i32 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %conv = zext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }
attributes #1 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After CalledValuePropagationPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i32 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %conv = zext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }
attributes #1 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After GlobalOptPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i32 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %conv = zext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

attributes #0 = { nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After PromotePass on strlen5 ***
; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i32 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %conv = zext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After InstCombinePass on strlen5 ***
; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After SimplifyCFGPass on strlen5 ***
; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After RequireAnalysisPass<GlobalsAA, Module> on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

attributes #0 = { nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After InvalidateAnalysisPass<AAManager> on strlen5 ***
; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After RequireAnalysisPass<ProfileSummaryAnalysis, Module> on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

attributes #0 = { nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After InlinerPass on (strlen5) ***
; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After InlinerPass on (strlen5) ***
; Function Attrs: nounwind
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After PostOrderFunctionAttrsPass on (strlen5) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After ArgumentPromotionPass on (strlen5) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After OpenMPOptCGSCCPass on (strlen5) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After SROAPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After EarlyCSEPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After SpeculativeExecutionPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After JumpThreadingPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After CorrelatedValuePropagationPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After SimplifyCFGPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After InstCombinePass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After AggressiveInstCombinePass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LibCallsShrinkWrapPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After TailCallElimPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After SimplifyCFGPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After ReassociatePass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After RequireAnalysisPass<OptimizationRemarkEmitterAnalysis, Function> on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LoopSimplifyPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LCSSAPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LoopInstSimplifyPass on do.body ***

; Preheader:
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
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
*** IR Dump After LoopSimplifyCFGPass on do.body ***

; Preheader:
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
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
*** IR Dump After LICMPass on do.body ***

; Preheader:
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
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
*** IR Dump After LoopRotatePass on do.body ***

; Preheader:
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
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
*** IR Dump After LICMPass on do.body ***

; Preheader:
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
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
*** IR Dump After SimpleLoopUnswitchPass on do.body ***

; Preheader:
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
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
*** IR Dump After SimplifyCFGPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After InstCombinePass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LoopSimplifyPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LCSSAPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LoopIdiomRecognizePass on do.body ***

; Preheader:
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
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
*** IR Dump After IndVarSimplifyPass on do.body ***

; Preheader:
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
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
*** IR Dump After LoopDeletionPass on do.body ***

; Preheader:
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
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
*** IR Dump After LoopFullUnrollPass on do.body ***

; Preheader:
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
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
*** IR Dump After SROAPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After MergedLoadStoreMotionPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After GVNPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After SCCPPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After BDCEPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After InstCombinePass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After JumpThreadingPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After CorrelatedValuePropagationPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After ADCEPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After MemCpyOptPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After DSEPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LoopSimplifyPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LCSSAPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LICMPass on do.body ***

; Preheader:
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
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
*** IR Dump After CoroElidePass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After SimplifyCFGPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After InstCombinePass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After CoroSplitPass on (strlen5) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After InvalidateAnalysisPass<ShouldNotRunFunctionPassesAnalysis> on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After DeadArgumentEliminationPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

attributes #0 = { nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After CoroCleanupPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

attributes #0 = { nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After GlobalOptPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

attributes #0 = { nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After GlobalDCEPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

attributes #0 = { nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After EliminateAvailableExternallyPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

attributes #0 = { nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After ReversePostOrderFunctionAttrsPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

attributes #0 = { nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After RecomputeGlobalsAAPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

attributes #0 = { nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After Float2IntPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LowerConstantIntrinsicsPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LoopSimplifyPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LCSSAPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LoopRotatePass on do.body ***

; Preheader:
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
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
*** IR Dump After LoopDeletionPass on do.body ***

; Preheader:
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
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
*** IR Dump After LoopDistributePass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After InjectTLIMappings on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LoopVectorizePass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LoopLoadEliminationPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After InstCombinePass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After SimplifyCFGPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After SLPVectorizerPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After VectorCombinePass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After InstCombinePass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LoopUnrollPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After WarnMissedTransformationsPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After InstCombinePass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After RequireAnalysisPass<OptimizationRemarkEmitterAnalysis, Function> on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LoopSimplifyPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LCSSAPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LICMPass on do.body ***

; Preheader:
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
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
*** IR Dump After AlignmentFromAssumptionsPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After LoopSinkPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %do.body ]
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr.lcssa to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After InstSimplifyPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After DivRemPairsPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After TailCallElimPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After SimplifyCFGPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After GlobalDCEPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

attributes #0 = { nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After ConstantMergePass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

attributes #0 = { nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After CGProfilePass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

attributes #0 = { nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After RelLookupTableConverterPass on [module] ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

attributes #0 = { nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After AnnotationRemarksPass on strlen5 ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After ObjC ARC contraction (objc-arc-contract) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After Pre-ISel Intrinsic Lowering (pre-isel-intrinsic-lowering) ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}

attributes #0 = { nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After Expand large div/rem (expand-large-div-rem) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After Expand Atomic instructions (atomic-expand) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After RISCV gather/scatter lowering (riscv-gather-scatter-lowering) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After RISCV CodeGenPrepare (riscv-codegenprepare) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After Module Verifier (verify) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After Canonicalize natural loops (loop-simplify) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds i8, ptr %s, i64 -1
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %s1.0 = phi ptr [ %add.ptr, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i8, ptr %s1.0, i64 1
  %0 = load i8, ptr %incdec.ptr, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %s to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i64 %sub.ptr.sub
}
*** IR Dump After Canonicalize Freeze Instructions in Loops (canon-freeze) ***
; Preheader:
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
*** IR Dump After Merge contiguous icmps into a memcmp (mergeicmps) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
*** IR Dump After Expand memcmp() to load/stores (expandmemcmp) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
*** IR Dump After Lower Garbage Collection Instructions (gc-lowering) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
*** IR Dump After Shadow Stack GC Lowering (shadow-stack-gc-lowering) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
*** IR Dump After Lower constant intrinsics (lower-constant-intrinsics) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
*** IR Dump After Remove unreachable blocks from the CFG (unreachableblockelim) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
*** IR Dump After Constant Hoisting (consthoist) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
*** IR Dump After Replace intrinsics with calls to vector library (replace-with-veclib) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
*** IR Dump After Partially inline calls to library functions (partially-inline-libcalls) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
*** IR Dump After Expand vector predication intrinsics (expandvp) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
*** IR Dump After Scalarize Masked Memory Intrinsics (scalarize-masked-mem-intrin) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
*** IR Dump After Expand reduction intrinsics (expand-reductions) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
*** IR Dump After TLS Variable Hoist (tlshoist) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
*** IR Dump After CodeGen Prepare (codegenprepare) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
*** IR Dump After Exception handling preparation (dwarfehprepare) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
*** IR Dump After A No-Op Barrier Pass (barrier) ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}

attributes #0 = { nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
*** IR Dump After Safe Stack instrumentation pass (safe-stack) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
*** IR Dump After Module Verifier (verify) ***
; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}
# *** IR Dump After Finalize ISel and expand pseudo-instructions (finalize-isel) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Early Tail Duplication (early-tailduplication) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Optimize machine instruction PHIs (opt-phis) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Slot index numbering (slotindexes) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x80000000); %bb.1(100.00%)
	  liveins: $x10
16B	  %2:gpr = COPY $x10
32B	  %4:gpr = COPY $x0
48B	  %3:gpr = COPY %4:gpr

64B	bb.1.do.body:
	; predecessors: %bb.0, %bb.1
	  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

80B	  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
96B	  %5:gpr = ADD %2:gpr, %0:gpr
112B	  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
128B	  %1:gpr = ADDI %0:gpr, 1
144B	  BNE killed %6:gpr, $x0, %bb.1
160B	  PseudoBR %bb.2

176B	bb.2.do.end:
	; predecessors: %bb.1

192B	  %7:gpr = ADDI %1:gpr, -1
208B	  $x10 = COPY %7:gpr
224B	  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Merge disjoint stack slots (stack-coloring) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Local Stack Slot Allocation (localstackalloc) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Remove dead machine instructions (dead-mi-elimination) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Early Machine Loop Invariant Code Motion (early-machinelicm) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Machine Common Subexpression Elimination (machine-cse) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Machine code sinking (machine-sink) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Peephole Optimizations (peephole-opt) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Remove dead machine instructions (dead-mi-elimination) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Machine InstCombiner (machine-combiner) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After RISCV sext.w Removal (riscv-sextw-removal) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After RISCV Pre-RA pseudo instruction expansion pass (riscv-prera-expand-pseudo) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After RISCV Merge Base Offset (riscv-merge-base-offset) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After RISCV arith subtree rebalancing (riscv-arith-subtree-rebalancing) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After RISCV Insert VSETVLI pass (riscv-insert-vsetvli) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Detect Dead Lanes (detect-dead-lanes) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Process Implicit Definitions (processimpdefs) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Remove unreachable machine basic blocks (unreachable-mbb-elimination) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI %1:gpr, -1
  $x10 = COPY %7:gpr
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Live Variable Analysis (livevars) ***:
# Machine code for function strlen5: IsSSA, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY killed $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY killed %4:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = PHI %3:gpr, %bb.0, %1:gpr, %bb.1
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI killed %0:gpr, 1
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI killed %1:gpr, -1
  $x10 = COPY killed %7:gpr
  PseudoRET implicit killed $x10

# End machine code for function strlen5.

# *** IR Dump After Eliminate PHI nodes for register allocation (phi-node-elimination) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY killed $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY killed %4:gpr
  %8:gpr = COPY killed %3:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = COPY killed %8:gpr
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI killed %0:gpr, 1
  %8:gpr = COPY %1:gpr
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI killed %1:gpr, -1
  $x10 = COPY killed %7:gpr
  PseudoRET implicit killed $x10

# End machine code for function strlen5.

# *** IR Dump After Two-Address instruction pass (twoaddressinstruction) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, TiedOpsRewritten
Function Live Ins: $x10 in %2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  %2:gpr = COPY killed $x10
  %4:gpr = COPY $x0
  %3:gpr = COPY killed %4:gpr
  %8:gpr = COPY killed %3:gpr

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

  %0:gpr = COPY killed %8:gpr
  %5:gpr = ADD %2:gpr, %0:gpr
  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  %1:gpr = ADDI killed %0:gpr, 1
  %8:gpr = COPY %1:gpr
  BNE killed %6:gpr, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1

  %7:gpr = ADDI killed %1:gpr, -1
  $x10 = COPY killed %7:gpr
  PseudoRET implicit killed $x10

# End machine code for function strlen5.

# *** IR Dump After Slot index numbering (slotindexes) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, TiedOpsRewritten
Function Live Ins: $x10 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x80000000); %bb.1(100.00%)
	  liveins: $x10
16B	  %2:gpr = COPY killed $x10
32B	  %4:gpr = COPY $x0
48B	  %3:gpr = COPY killed %4:gpr
64B	  %8:gpr = COPY killed %3:gpr

80B	bb.1.do.body:
	; predecessors: %bb.0, %bb.1
	  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

96B	  %0:gpr = COPY killed %8:gpr
112B	  %5:gpr = ADD %2:gpr, %0:gpr
128B	  %6:gpr = LBU killed %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
144B	  %1:gpr = ADDI killed %0:gpr, 1
160B	  %8:gpr = COPY %1:gpr
176B	  BNE killed %6:gpr, $x0, %bb.1
192B	  PseudoBR %bb.2

208B	bb.2.do.end:
	; predecessors: %bb.1

224B	  %7:gpr = ADDI killed %1:gpr, -1
240B	  $x10 = COPY killed %7:gpr
256B	  PseudoRET implicit killed $x10

# End machine code for function strlen5.

# *** IR Dump After Live Interval Analysis (liveintervals) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, TiedOpsRewritten
Function Live Ins: $x10 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x80000000); %bb.1(100.00%)
	  liveins: $x10
16B	  %2:gpr = COPY $x10
32B	  %4:gpr = COPY $x0
48B	  %3:gpr = COPY %4:gpr
64B	  %8:gpr = COPY %3:gpr

80B	bb.1.do.body:
	; predecessors: %bb.0, %bb.1
	  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

96B	  %0:gpr = COPY %8:gpr
112B	  %5:gpr = ADD %2:gpr, %0:gpr
128B	  %6:gpr = LBU %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
144B	  %1:gpr = ADDI %0:gpr, 1
160B	  %8:gpr = COPY %1:gpr
176B	  BNE %6:gpr, $x0, %bb.1
192B	  PseudoBR %bb.2

208B	bb.2.do.end:
	; predecessors: %bb.1

224B	  %7:gpr = ADDI %1:gpr, -1
240B	  $x10 = COPY %7:gpr
256B	  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Simple Register Coalescing (simple-register-coalescing) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, TiedOpsRewritten
Function Live Ins: $x10 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x80000000); %bb.1(100.00%)
	  liveins: $x10
16B	  %2:gpr = COPY $x10
64B	  %8:gpr = COPY $x0

80B	bb.1.do.body:
	; predecessors: %bb.0, %bb.1
	  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

112B	  %5:gpr = ADD %2:gpr, %8:gpr
128B	  %6:gpr = LBU %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
144B	  %8:gpr = ADDI %8:gpr, 1
176B	  BNE %6:gpr, $x0, %bb.1
192B	  PseudoBR %bb.2

208B	bb.2.do.end:
	; predecessors: %bb.1

224B	  %7:gpr = ADDI %8:gpr, -1
240B	  $x10 = COPY %7:gpr
256B	  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Rename Disconnected Subregister Components (rename-independent-subregs) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, TiedOpsRewritten
Function Live Ins: $x10 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x80000000); %bb.1(100.00%)
	  liveins: $x10
16B	  %2:gpr = COPY $x10
64B	  %8:gpr = COPY $x0

80B	bb.1.do.body:
	; predecessors: %bb.0, %bb.1
	  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

112B	  %5:gpr = ADD %2:gpr, %8:gpr
128B	  %6:gpr = LBU %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
144B	  %8:gpr = ADDI %8:gpr, 1
176B	  BNE %6:gpr, $x0, %bb.1
192B	  PseudoBR %bb.2

208B	bb.2.do.end:
	; predecessors: %bb.1

224B	  %7:gpr = ADDI %8:gpr, -1
240B	  $x10 = COPY %7:gpr
256B	  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Machine Instruction Scheduler (machine-scheduler) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, TiedOpsRewritten
Function Live Ins: $x10 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x80000000); %bb.1(100.00%)
	  liveins: $x10
16B	  %2:gpr = COPY $x10
64B	  %8:gpr = COPY $x0

80B	bb.1.do.body:
	; predecessors: %bb.0, %bb.1
	  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

112B	  %5:gpr = ADD %2:gpr, %8:gpr
128B	  %6:gpr = LBU %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
144B	  %8:gpr = ADDI %8:gpr, 1
176B	  BNE %6:gpr, $x0, %bb.1
192B	  PseudoBR %bb.2

208B	bb.2.do.end:
	; predecessors: %bb.1

224B	  %7:gpr = ADDI %8:gpr, -1
240B	  $x10 = COPY %7:gpr
256B	  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Debug Variable Analysis (livedebugvars) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x80000000); %bb.1(100.00%)
	  liveins: $x10
16B	  %2:gpr = COPY $x10
64B	  %8:gpr = COPY $x0

80B	bb.1.do.body:
	; predecessors: %bb.0, %bb.1
	  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

112B	  %5:gpr = ADD %2:gpr, %8:gpr
128B	  %6:gpr = LBU %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
144B	  %8:gpr = ADDI %8:gpr, 1
176B	  BNE %6:gpr, $x0, %bb.1
192B	  PseudoBR %bb.2

208B	bb.2.do.end:
	; predecessors: %bb.1

224B	  %7:gpr = ADDI %8:gpr, -1
240B	  $x10 = COPY %7:gpr
256B	  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Live Stack Slot Analysis (livestacks) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x80000000); %bb.1(100.00%)
	  liveins: $x10
16B	  %2:gpr = COPY $x10
64B	  %8:gpr = COPY $x0

80B	bb.1.do.body:
	; predecessors: %bb.0, %bb.1
	  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

112B	  %5:gpr = ADD %2:gpr, %8:gpr
128B	  %6:gpr = LBU %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
144B	  %8:gpr = ADDI %8:gpr, 1
176B	  BNE %6:gpr, $x0, %bb.1
192B	  PseudoBR %bb.2

208B	bb.2.do.end:
	; predecessors: %bb.1

224B	  %7:gpr = ADDI %8:gpr, -1
240B	  $x10 = COPY %7:gpr
256B	  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Virtual Register Map (virtregmap) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x80000000); %bb.1(100.00%)
	  liveins: $x10
16B	  %2:gpr = COPY $x10
64B	  %8:gpr = COPY $x0

80B	bb.1.do.body:
	; predecessors: %bb.0, %bb.1
	  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

112B	  %5:gpr = ADD %2:gpr, %8:gpr
128B	  %6:gpr = LBU %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
144B	  %8:gpr = ADDI %8:gpr, 1
176B	  BNE %6:gpr, $x0, %bb.1
192B	  PseudoBR %bb.2

208B	bb.2.do.end:
	; predecessors: %bb.1

224B	  %7:gpr = ADDI %8:gpr, -1
240B	  $x10 = COPY %7:gpr
256B	  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Live Register Matrix (liveregmatrix) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x80000000); %bb.1(100.00%)
	  liveins: $x10
16B	  %2:gpr = COPY $x10
64B	  %8:gpr = COPY $x0

80B	bb.1.do.body:
	; predecessors: %bb.0, %bb.1
	  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

112B	  %5:gpr = ADD %2:gpr, %8:gpr
128B	  %6:gpr = LBU %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
144B	  %8:gpr = ADDI %8:gpr, 1
176B	  BNE %6:gpr, $x0, %bb.1
192B	  PseudoBR %bb.2

208B	bb.2.do.end:
	; predecessors: %bb.1

224B	  %7:gpr = ADDI %8:gpr, -1
240B	  $x10 = COPY %7:gpr
256B	  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Greedy Register Allocator (greedy) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x80000000); %bb.1(100.00%)
	  liveins: $x10
16B	  %2:gpr = COPY $x10
64B	  %8:gpr = COPY $x0

80B	bb.1.do.body:
	; predecessors: %bb.0, %bb.1
	  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)

112B	  %5:gpr = ADD %2:gpr, %8:gpr
128B	  %6:gpr = LBU %5:gpr, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
144B	  %8:gpr = ADDI %8:gpr, 1
176B	  BNE %6:gpr, $x0, %bb.1
192B	  PseudoBR %bb.2

208B	bb.2.do.end:
	; predecessors: %bb.1

224B	  %7:gpr = ADDI %8:gpr, -1
240B	  $x10 = COPY %7:gpr
256B	  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Virtual Register Rewriter (virtregrewriter) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

0B	bb.0.entry:
	  successors: %bb.1(0x80000000); %bb.1(100.00%)
	  liveins: $x10
64B	  renamable $x11 = COPY $x0

80B	bb.1.do.body:
	; predecessors: %bb.0, %bb.1
	  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
	  liveins: $x10, $x11
112B	  renamable $x12 = ADD renamable $x10, renamable $x11
128B	  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
144B	  renamable $x11 = ADDI killed renamable $x11, 1
176B	  BNE killed renamable $x12, $x0, %bb.1
192B	  PseudoBR %bb.2

208B	bb.2.do.end:
	; predecessors: %bb.1
	  liveins: $x11
224B	  renamable $x10 = ADDI killed renamable $x11, -1
256B	  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Register Allocation Pass Scoring (regallocscoringpass) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

0B	bb.0.entry:
	  successors: %bb.1(0x80000000); %bb.1(100.00%)
	  liveins: $x10
64B	  renamable $x11 = COPY $x0

80B	bb.1.do.body:
	; predecessors: %bb.0, %bb.1
	  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
	  liveins: $x10, $x11
112B	  renamable $x12 = ADD renamable $x10, renamable $x11
128B	  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
144B	  renamable $x11 = ADDI killed renamable $x11, 1
176B	  BNE killed renamable $x12, $x0, %bb.1
192B	  PseudoBR %bb.2

208B	bb.2.do.end:
	; predecessors: %bb.1
	  liveins: $x11
224B	  renamable $x10 = ADDI killed renamable $x11, -1
256B	  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Stack Slot Coloring (stack-slot-coloring) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

0B	bb.0.entry:
	  successors: %bb.1(0x80000000); %bb.1(100.00%)
	  liveins: $x10
64B	  renamable $x11 = COPY $x0

80B	bb.1.do.body:
	; predecessors: %bb.0, %bb.1
	  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
	  liveins: $x10, $x11
112B	  renamable $x12 = ADD renamable $x10, renamable $x11
128B	  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
144B	  renamable $x11 = ADDI killed renamable $x11, 1
176B	  BNE killed renamable $x12, $x0, %bb.1
192B	  PseudoBR %bb.2

208B	bb.2.do.end:
	; predecessors: %bb.1
	  liveins: $x11
224B	  renamable $x10 = ADDI killed renamable $x11, -1
256B	  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Machine Copy Propagation Pass (machine-cp) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  renamable $x11 = COPY $x0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  renamable $x11 = ADDI killed renamable $x11, 1
  BNE killed renamable $x12, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Machine Loop Invariant Code Motion (machinelicm) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  renamable $x11 = COPY $x0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  renamable $x11 = ADDI killed renamable $x11, 1
  BNE killed renamable $x12, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After RISCV Redundant Copy Elimination (riscv-copyelim) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  renamable $x11 = COPY $x0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  renamable $x11 = ADDI killed renamable $x11, 1
  BNE killed renamable $x12, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Remove Redundant DEBUG_VALUE analysis (removeredundantdebugvalues) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  renamable $x11 = COPY $x0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  renamable $x11 = ADDI killed renamable $x11, 1
  BNE killed renamable $x12, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Fixup Statepoint Caller Saved (fixup-statepoint-caller-saved) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  renamable $x11 = COPY $x0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  renamable $x11 = ADDI killed renamable $x11, 1
  BNE killed renamable $x12, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After PostRA Machine Sink (postra-machine-sink) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  renamable $x11 = COPY $x0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  renamable $x11 = ADDI killed renamable $x11, 1
  BNE killed renamable $x12, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Shrink Wrapping analysis (shrink-wrap) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  renamable $x11 = COPY $x0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  renamable $x11 = ADDI killed renamable $x11, 1
  BNE killed renamable $x12, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Prologue/Epilogue Insertion & Frame Finalization (prologepilog) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  renamable $x11 = COPY $x0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  renamable $x11 = ADDI killed renamable $x11, 1
  BNE killed renamable $x12, $x0, %bb.1
  PseudoBR %bb.2

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Control Flow Optimizer (branch-folder) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  renamable $x11 = COPY $x0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  renamable $x11 = ADDI killed renamable $x11, 1
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Tail Duplication (tailduplication) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  renamable $x11 = COPY $x0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  renamable $x11 = ADDI killed renamable $x11, 1
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Machine Copy Propagation Pass (machine-cp) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  renamable $x11 = COPY $x0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  renamable $x11 = ADDI killed renamable $x11, 1
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Post-RA pseudo instruction expansion pass (postrapseudos) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  $x11 = ADDI $x0, 0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  renamable $x11 = ADDI killed renamable $x11, 1
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit $x10

# End machine code for function strlen5.

# *** IR Dump After Post RA top-down list latency scheduler (post-RA-sched) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  $x11 = ADDI $x0, 0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x11 = ADDI killed renamable $x11, 1
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit killed $x10

# End machine code for function strlen5.

# *** IR Dump After Analyze Machine Code For Garbage Collection (gc-analysis) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  $x11 = ADDI $x0, 0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x11 = ADDI killed renamable $x11, 1
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit killed $x10

# End machine code for function strlen5.

# *** IR Dump After Branch Probability Basic Block Placement (block-placement) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  $x11 = ADDI $x0, 0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x11 = ADDI killed renamable $x11, 1
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit killed $x10

# End machine code for function strlen5.

# *** IR Dump After Insert fentry calls (fentry-insert) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  $x11 = ADDI $x0, 0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x11 = ADDI killed renamable $x11, 1
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit killed $x10

# End machine code for function strlen5.

# *** IR Dump After Insert XRay ops (xray-instrumentation) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  $x11 = ADDI $x0, 0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x11 = ADDI killed renamable $x11, 1
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit killed $x10

# End machine code for function strlen5.

# *** IR Dump After Implement the 'patchable-function' attribute (patchable-function) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  $x11 = ADDI $x0, 0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x11 = ADDI killed renamable $x11, 1
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit killed $x10

# End machine code for function strlen5.

# *** IR Dump After RISCV add/sub combiner pass (riscv-addsub-comb) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  $x11 = ADDI $x0, 0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x11 = ADDI killed renamable $x11, 1
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit killed $x10

# End machine code for function strlen5.

# *** IR Dump After Branch relaxation pass (branch-relaxation) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  $x11 = ADDI $x0, 0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x11 = ADDI killed renamable $x11, 1
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit killed $x10

# End machine code for function strlen5.

# *** IR Dump After RISCV Make Compressible (riscv-make-compressible) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  $x11 = ADDI $x0, 0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x11 = ADDI killed renamable $x11, 1
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit killed $x10

# End machine code for function strlen5.

# *** IR Dump After Contiguously Lay Out Funclets (funclet-layout) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  $x11 = ADDI $x0, 0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x11 = ADDI killed renamable $x11, 1
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit killed $x10

# End machine code for function strlen5.

# *** IR Dump After StackMap Liveness Analysis (stackmap-liveness) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  $x11 = ADDI $x0, 0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x11 = ADDI killed renamable $x11, 1
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit killed $x10

# End machine code for function strlen5.

# *** IR Dump After Live DEBUG_VALUE analysis (livedebugvalues) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  $x11 = ADDI $x0, 0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x11 = ADDI killed renamable $x11, 1
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit killed $x10

# End machine code for function strlen5.

*** IR Dump After Machine Outliner (machine-outliner) ***
; ModuleID = 'ex1.c'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

; Function Attrs: nofree norecurse nosync nounwind readonly
define dso_local i64 @strlen5(ptr noundef %s) local_unnamed_addr #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %do.body ], [ 0, %entry ]
  %uglygep = getelementptr i8, ptr %s, i64 %lsr.iv
  %0 = load i8, ptr %uglygep, align 1, !tbaa !4
  %cmp.not = icmp eq i8 %0, 0
  %lsr.iv.next = add i64 %lsr.iv, 1
  br i1 %cmp.not, label %do.end, label %do.body, !llvm.loop !7

do.end:                                           ; preds = %do.body
  %1 = add i64 %lsr.iv.next, -1
  ret i64 %1
}

attributes #0 = { nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+zicsr,+zifencei,-save-restore" "tune-cpu"="scr7" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 88a5a1905b363f00e776c41b78f9c9c4d756d7d8)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
# *** IR Dump After RISCV pseudo instruction expansion pass (riscv-expand-pseudo) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  $x11 = ADDI $x0, 0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x11 = ADDI killed renamable $x11, 1
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit killed $x10

# End machine code for function strlen5.

# *** IR Dump After RISCV atomic pseudo instruction expansion pass (riscv-expand-atomic-pseudo) ***:
# Machine code for function strlen5: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $x10

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $x10
  $x11 = ADDI $x0, 0

bb.1.do.body:
; predecessors: %bb.0, %bb.1
  successors: %bb.2(0x04000000), %bb.1(0x7c000000); %bb.2(3.12%), %bb.1(96.88%)
  liveins: $x10, $x11
  renamable $x12 = ADD renamable $x10, renamable $x11
  renamable $x11 = ADDI killed renamable $x11, 1
  renamable $x12 = LBU killed renamable $x12, 0 :: (load (s8) from %ir.uglygep, !tbaa !4)
  BNE killed renamable $x12, $x0, %bb.1

bb.2.do.end:
; predecessors: %bb.1
  liveins: $x11
  renamable $x10 = ADDI killed renamable $x11, -1
  PseudoRET implicit killed $x10

# End machine code for function strlen5.


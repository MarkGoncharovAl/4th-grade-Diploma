source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

define dso_local noundef signext i32 @_Z3fooPiS_i(ptr noundef %b, ptr noundef %e, i32 noundef signext %a){
entry:
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %e to i64
  %sub.ptr.rhs.cast.i.i.i = ptrtoint ptr %b to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %cmp87.i.i.i = icmp sgt i64 %sub.ptr.sub.i.i.i, 15
  br i1 %cmp87.i.i.i, label %for.body.preheader.i.i.i, label %for.end.i.i.i

for.body.preheader.i.i.i:                         ; preds = %entry
; (end - start) / 4
  %shr.i.i.i = lshr i64 %sub.ptr.sub.i.i.i, 4
  br label %for.body.i.i.i

for.body.i.i.i:                                   ; preds = %if.end12.i.i.i, %for.body.preheader.i.i.i
; MUST BE IN PREHEADER TO COMPARE WITH __first.addr
  %__trip_count.089.i.i.i = phi i64 [ %dec.i.i.i, %if.end12.i.i.i ], [ %shr.i.i.i, %for.body.preheader.i.i.i ]
; THE MAIN IV
  %__first.addr.088.i.i.i = phi ptr [ %incdec.ptr13.i.i.i, %if.end12.i.i.i ], [ %b, %for.body.preheader.i.i.i ]
  %__first.addr.0.val64.i.i.i = load i32, ptr %__first.addr.088.i.i.i, align 4
  %cmp.i.i.i.i.i = icmp eq i32 %__first.addr.0.val64.i.i.i, %a
  br i1 %cmp.i.i.i.i.i, label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit", label %if.end.i.i.i

if.end.i.i.i:                                     ; preds = %for.body.i.i.i
  %incdec.ptr.i.i.i = getelementptr inbounds i32, ptr %__first.addr.088.i.i.i, i64 1
  %incdec.ptr.val.i.i.i = load i32, ptr %incdec.ptr.i.i.i, align 4
  %cmp.i.i65.i.i.i = icmp eq i32 %incdec.ptr.val.i.i.i, %a
  br i1 %cmp.i.i65.i.i.i, label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit", label %if.end4.i.i.i

if.end4.i.i.i:                                    ; preds = %if.end.i.i.i
  %incdec.ptr5.i.i.i = getelementptr inbounds i32, ptr %__first.addr.088.i.i.i, i64 2
  %incdec.ptr5.val.i.i.i = load i32, ptr %incdec.ptr5.i.i.i, align 4
  %cmp.i.i66.i.i.i = icmp eq i32 %incdec.ptr5.val.i.i.i, %a
  br i1 %cmp.i.i66.i.i.i, label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit15", label %if.end8.i.i.i

if.end8.i.i.i:                                    ; preds = %if.end4.i.i.i
  %incdec.ptr9.i.i.i = getelementptr inbounds i32, ptr %__first.addr.088.i.i.i, i64 3
  %incdec.ptr9.val.i.i.i = load i32, ptr %incdec.ptr9.i.i.i, align 4
  %cmp.i.i67.i.i.i = icmp eq i32 %incdec.ptr9.val.i.i.i, %a
  br i1 %cmp.i.i67.i.i.i, label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit17", label %if.end12.i.i.i

if.end12.i.i.i:                                   ; preds = %if.end8.i.i.i
  %incdec.ptr13.i.i.i = getelementptr inbounds i32, ptr %__first.addr.088.i.i.i, i64 4
  %dec.i.i.i = add nsw i64 %__trip_count.089.i.i.i, -1
  %cmp.i.i.i = icmp sgt i64 %__trip_count.089.i.i.i, 1
  br i1 %cmp.i.i.i, label %for.body.i.i.i, label %for.end.loopexit.i.i.i

for.end.loopexit.i.i.i:                           ; preds = %if.end12.i.i.i
  %.pre.i.i.i = ptrtoint ptr %incdec.ptr13.i.i.i to i64
  %.pre94.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %.pre.i.i.i
  br label %for.end.i.i.i

for.end.i.i.i:                                    ; preds = %for.end.loopexit.i.i.i, %entry
  %sub.ptr.sub16.pre-phi.i.i.i = phi i64 [ %.pre94.i.i.i, %for.end.loopexit.i.i.i ], [ %sub.ptr.sub.i.i.i, %entry ]
  %__first.addr.0.lcssa.i.i.i = phi ptr [ %incdec.ptr13.i.i.i, %for.end.loopexit.i.i.i ], [ %b, %entry ]
  %sub.ptr.div17.i.i.i = ashr exact i64 %sub.ptr.sub16.pre-phi.i.i.i, 2
  switch i64 %sub.ptr.div17.i.i.i, label %sw.default.i.i.i [
    i64 3, label %sw.bb.i.i.i
    i64 2, label %sw.bb22.i.i.i
    i64 1, label %sw.bb27.i.i.i
  ]

sw.bb.i.i.i:                                      ; preds = %for.end.i.i.i
  %__first.addr.0.val.i.i.i = load i32, ptr %__first.addr.0.lcssa.i.i.i, align 4
  %cmp.i.i68.i.i.i = icmp eq i32 %__first.addr.0.val.i.i.i, %a
  br i1 %cmp.i.i68.i.i.i, label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit", label %if.end20.i.i.i

if.end20.i.i.i:                                   ; preds = %sw.bb.i.i.i
  %incdec.ptr21.i.i.i = getelementptr inbounds i32, ptr %__first.addr.0.lcssa.i.i.i, i64 1
  br label %sw.bb22.i.i.i

sw.bb22.i.i.i:                                    ; preds = %if.end20.i.i.i, %for.end.i.i.i
  %__first.addr.1.i.i.i = phi ptr [ %__first.addr.0.lcssa.i.i.i, %for.end.i.i.i ], [ %incdec.ptr21.i.i.i, %if.end20.i.i.i ]
  %__first.addr.1.val.i.i.i = load i32, ptr %__first.addr.1.i.i.i, align 4
  %cmp.i.i69.i.i.i = icmp eq i32 %__first.addr.1.val.i.i.i, %a
  br i1 %cmp.i.i69.i.i.i, label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit", label %if.end25.i.i.i

if.end25.i.i.i:                                   ; preds = %sw.bb22.i.i.i
  %incdec.ptr26.i.i.i = getelementptr inbounds i32, ptr %__first.addr.1.i.i.i, i64 1
  br label %sw.bb27.i.i.i

sw.bb27.i.i.i:                                    ; preds = %if.end25.i.i.i, %for.end.i.i.i
  %__first.addr.2.i.i.i = phi ptr [ %__first.addr.0.lcssa.i.i.i, %for.end.i.i.i ], [ %incdec.ptr26.i.i.i, %if.end25.i.i.i ]
  %__first.addr.2.val.i.i.i = load i32, ptr %__first.addr.2.i.i.i, align 4
  %cmp.i.i70.i.i.i = icmp eq i32 %__first.addr.2.val.i.i.i, %a
  br i1 %cmp.i.i70.i.i.i, label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit", label %sw.default.i.i.i

sw.default.i.i.i:                                 ; preds = %sw.bb27.i.i.i, %for.end.i.i.i
  br label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit"

"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit": ; preds = %if.end.i.i.i
  %incdec.ptr.i.i.i.le = getelementptr inbounds i32, ptr %__first.addr.088.i.i.i, i64 1
  br label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit"

"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit15": ; preds = %if.end4.i.i.i
  %incdec.ptr5.i.i.i.le = getelementptr inbounds i32, ptr %__first.addr.088.i.i.i, i64 2
  br label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit"

"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit17": ; preds = %if.end8.i.i.i
  %incdec.ptr9.i.i.i.le = getelementptr inbounds i32, ptr %__first.addr.088.i.i.i, i64 3
  br label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit"

"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit": ; preds = %for.body.i.i.i
  br label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit"

"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit": ; preds = %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit", %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit", %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit15", %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit17", %sw.bb.i.i.i, %sw.bb22.i.i.i, %sw.bb27.i.i.i, %sw.default.i.i.i
  %retval.0.i.i.i = phi ptr [ %e, %sw.default.i.i.i ], [ %__first.addr.0.lcssa.i.i.i, %sw.bb.i.i.i ], [ %__first.addr.1.i.i.i, %sw.bb22.i.i.i ], [ %__first.addr.2.i.i.i, %sw.bb27.i.i.i ], [ %incdec.ptr.i.i.i.le, %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit" ], [ %incdec.ptr5.i.i.i.le, %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit15" ], [ %incdec.ptr9.i.i.i.le, %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit17" ], [ %__first.addr.088.i.i.i, %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit" ]
  %cmp.not = icmp eq ptr %retval.0.i.i.i, %e
  %.a = select i1 %cmp.not, i32 0, i32 %a
  ret i32 %.a
}

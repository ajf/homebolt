plan profiles::kubelet(
  TargetSpec $targets
) {
  $targets.apply_prep

  apply($targets) {

  }
}

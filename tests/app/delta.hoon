/+  *test
/=  delta  /app/delta
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0
  $:  [%0 values=(list @)]
  ==
+$  card  card:agent:gall
--
|%
++  bowl
  |=  run=@ud
  ^-  bowl:gall
  :*  [~zod ~zod %delta ~]
      [~ ~ ~]
      [run `@uvJ`(shax run) (add (mul run ~s1) *time) [~zod %delta ud+run]]
  ==
::
++  test-delta
  =/  run=@ud  42
  =/  agent  +:~(on-init delta (bowl run))
  ;:  weld
    =^  move  agent
      (~(on-poke agent (bowl run)) %delta-action !>([%push ~zod 10.000]))
    =+  !<(=state-0 on-save:agent)
    %+  expect-eq
        !>  `(list @)`~[10.000]
        !>  values.state-0
  ::
    =^  move  agent
      (~(on-poke agent (bowl run)) %delta-action !>([%push ~zod 20.000]))
    =^  move  agent
      (~(on-poke agent (bowl run)) %delta-action !>([%push ~zod 10.000]))
    =+  !<(=state-0 on-save:agent)
    %+  expect-eq
        !>  `(list @)`~[10.000 20.000]
        !>  values.state-0
  ::
    =^  move  agent
      (~(on-poke agent (bowl run)) %delta-action !>([%pop ~zod]))
    =+  !<(=state-0 on-save:agent)
    %+  expect-eq
        !>  `(list @)`~
        !>  values.state-0
  ::
    =^  move  agent
      (~(on-poke agent (bowl run)) %delta-action !>([%push ~zod 20.000]))
    =^  move  agent
      (~(on-poke agent (bowl run)) %delta-action !>([%pop ~zod]))
    =+  !<(=state-0 on-save:agent)
    %+  expect-eq
        !>  `(list @)`~
        !>  values.state-0
  ==
::
--
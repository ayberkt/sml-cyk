structure Imperative = struct
  datatype for =
      upto of int * int
    | downto of int * int

  infix upto downto

  val for =
    fn lo upto up =>
      (fn f =>
          let
            fun loop lo =
              if lo > up then
                ()
              else
                (f lo; loop (lo+1))
          in
            loop lo
          end)
    | up downto lo =>
        (fn f => let fun loop up = if up < lo then ()
                                    else (f up; loop (up-1))
                  in loop up end)
end

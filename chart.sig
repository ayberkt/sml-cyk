signature CHART = sig
  type chart

  val emptyChart : chart
  val set        : int * int * int -> bool -> unit
  val get        : int * int * int -> bool
end

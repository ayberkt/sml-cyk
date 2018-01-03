signature CHART = sig
  type chart

  (* Takes three integers specifying the dimensions. *)
  val initChart  : int * int * int -> unit

  val set        : int * int * int -> bool -> unit
  val get        : int * int * int -> bool
end

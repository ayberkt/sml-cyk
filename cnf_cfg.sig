signature CNFCFG = sig
  type terminal
  type variable

  datatype term =
      INR of variable * variable
    | INL of terminal

  type production = terminal * term

  val v     : terminal   list
  val sigma : variable   list
  val r     : production list
  val s     : variable
end

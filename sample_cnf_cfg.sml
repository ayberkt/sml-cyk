structure SampleGrammar : CNFCFG = struct
  type terminal = string
  type variable = string

  datatype term =
      INR of variable * variable
    | INL of terminal

  type production = terminal * term

  val ===> =
    fn (v : variable, tm : term) => (v, tm)
  infix ===>

  val s     = "S"
  val v     = ["0", "1"]
  val sigma = ["A", "B", "S"]
  val r     = [
      "A"  ===> INL "0",
      "B"  ===> INL "1",
      "S"  ===> INR ("A", "B")
    ]
end

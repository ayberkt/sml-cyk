functor MkCNFCFGParser(G : CNFCFG) = struct
  open Imperative infix 6 upto downto

  fun parse (n, r) s =
    let
      val chart = NaiveChart.initChart (n, n, r)
    in
      ()
    end
end

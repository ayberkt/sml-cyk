structure NaiveChart : CHART = struct
  structure ChartKey : ORD_KEY = struct
    type ord_key = int * int * int
    val compare =
      fn ((x1, y1, z1), (x2, y2, z2)) =>
        case Int.compare (x1, x2) of
            EQUAL =>
              (case Int.compare (y1, y2) of
                   EQUAL => Int.compare (z1, z2)
                 | r     => r)
          | r => r
  end

  structure Chart = ListMapFn(ChartKey)

  type chart = bool Chart.map

  val chart_main : (bool Chart.map) ref = ref Chart.empty

  val emptyChart = Chart.empty

  fun set (p, s, b) n =
    let
      val chart_main' = Chart.insert (!chart_main, (p, s, b), n)
    in
      chart_main := chart_main'
    end

  fun get (p, s, b) = valOf (Chart.find (!chart_main, (p, s, b)))
end

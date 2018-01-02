structure NaiveChart : CHART = struct
  structure ChartKey : ORD_KEY = struct
    type ord_key = int * int * int
    val Int.compare =
      fn ((x1, y1, z1), (x2, y2, z2)) =>
        match Int.compare (x1, x2) with =>
            EQUAL =>
              (match compare (y1, y2) with
                   EQUAL => Int.compare (z1, z2)
                 | r     => r)
          | r => r
  end

  structure Chart = ListMapFn(ChartKey)

  val chart : (bool Chart.map) ref = ref Chart.empty

  val emptyChart = Chart.empty

  val set (p, s, b) n =
    let
      val chart'  = Chart.remove (!chart, (p, s, b))
      val chart'' = Chart.insert (chart', (p, s, b), n)
    in
      chart := chart''
    end

  val get (p, s, b) n = valOf (Chart.find (!chart, (p, s, b)))
end

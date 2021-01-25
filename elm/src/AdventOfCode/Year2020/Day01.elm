module AdventOfCode.Year2020.Day01 exposing (..)

-- MODEL


type alias ExpenseReport =
    String


type alias Entry =
    Int


type alias EntriesToFind =
    Int


type alias Result =
    Int



{- RUN

   Takes in an `ExpenseReport` string where each line is an Entry with an integer
   value.

   Find the two integers that sum to a value of 2020.

   The `Result` return value is the integer product of those two integers.

-}


run : EntriesToFind -> ExpenseReport -> Result
run entriesToFind expenseReport =
    case entriesToFind of
        2 ->
            expenseReport
                |> processInput
                |> findTwoEntriesThatSumTo2020
                |> multiplyTwoEntries

        3 ->
            expenseReport
                |> processInput
                |> findThreeEntriesThatSumTo2020
                |> multiplyThreeEntries

        _ ->
            0



-- PROCESS INPUT


processInput : ExpenseReport -> List Entry
processInput =
    String.trim
        >> String.lines
        >> List.filterMap String.toInt


findTwoEntriesThatSumTo2020 : List Entry -> Maybe ( Entry, Entry )
findTwoEntriesThatSumTo2020 entries =
    entries
        |> List.concatMap
            (\entry1 ->
                List.filterMap
                    (\entry2 ->
                        if entry1 + entry2 == 2020 then
                            Just ( entry1, entry2 )

                        else
                            Nothing
                    )
                    entries
            )
        |> List.head


findThreeEntriesThatSumTo2020 : List Entry -> Maybe ( Entry, Entry, Entry )
findThreeEntriesThatSumTo2020 entries =
    entries
        |> List.concatMap
            (\entry1 ->
                entries
                    |> List.concatMap
                        (\entry2 ->
                            entries
                                |> List.filterMap
                                    (\entry3 ->
                                        if entry1 + entry2 + entry3 == 2020 then
                                            Just ( entry1, entry2, entry3 )

                                        else
                                            Nothing
                                    )
                        )
            )
        |> List.head


multiplyTwoEntries : Maybe ( Entry, Entry ) -> Int
multiplyTwoEntries maybeEntries =
    case maybeEntries of
        Just ( entry1, entry2 ) ->
            entry1 * entry2

        Nothing ->
            0


multiplyThreeEntries : Maybe ( Entry, Entry, Entry ) -> Int
multiplyThreeEntries maybeEntries =
    case maybeEntries of
        Just ( entry1, entry2, entry3 ) ->
            List.product [ entry1, entry2, entry3 ]

        Nothing ->
            0



-- INPUT


rawInput : String
rawInput =
    """
1934
1702
1571
1737
1977
1531
1428
1695
1794
1101
13
1164
1235
1289
1736
1814
1363
1147
1111
1431
1765
1515
1184
1036
1803
1791
1638
1809
1283
1980
1854
1878
1574
1352
1151
730
1581
1990
1919
2003
1538
1663
1735
1772
1830
1152
1022
1774
1544
1551
1835
1383
1614
1396
1715
1530
295
1208
1978
1104
1691
1176
1183
1909
1192
1535
1924
1268
1969
1954
1760
1077
1734
1371
1676
1933
1400
1928
1982
1541
1106
1248
1346
1782
1142
1849
1798
1362
1379
1886
1265
1226
1751
1575
1027
1710
1601
1205
1922
1452
1206
1263
2000
1957
1951
1834
1533
1149
1245
1564
1182
1237
1013
1254
1895
1504
1480
1556
1821
1589
1864
1573
1698
1927
1434
516
1722
1360
1940
1212
1329
1675
1812
1917
1302
1604
1336
1233
1405
1179
1169
1081
1941
1553
1236
1824
1923
1938
1475
1446
1545
1853
1664
317
1489
1884
1743
1621
1128
1474
1505
394
1387
1509
1627
1914
1913
1949
1843
1847
1882
1486
1082
1802
1645
1690
1629
1377
2004
1044
1191
1014
1857
1813
1572
1055
1002
1721
1273
1417
1968
1888
1863
1278
1141
1964
1259
1823
1181
1779
    """

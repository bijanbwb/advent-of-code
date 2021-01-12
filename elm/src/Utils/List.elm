module Utils.List exposing (reject)


reject : (a -> Bool) -> List a -> List a
reject predicate =
    List.filter (not << predicate)

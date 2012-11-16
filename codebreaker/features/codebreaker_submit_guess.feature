Feature: code-breaker submits guess

  The code-breaker submits a guess of four numbers. The game mark the guess with + and - signs.
  
  For each number in the guess that matchs the number and position of a number in the secret code, the mark includes one +. For each number in the guess that matchs the number but not the position of a number in the secret code, a - is added to the mark.

  Each position in the secret code can only be matched once. For example, a guess of 1134 against a secret ocode of 1234 would get three plus signs: one for each

  Scenario Outline: submit guess
    Given the secret code is "<code>"
    When I guess "<guess>"
    Then the mark should be "<mark>"
    
    Scenarios: no matches
      | code | guess | mark |
      | 1234 | 5577  |      |
      | 1234 | 8697  |      |

    Scenarios: 1 number correct
      | code | guess | mark |
      | 1234 | 1888  | +    |
      | 1234 | 5488  | -    |

    Scenarios: 2 numbers correct
      | code | guess | mark |
      | 1234 | 1278  | ++   |
      | 1234 | 1498  | +-   |
      | 1234 | 7723  | --   |

    Scenarios: 3 numbers correct
      | code | guess | mark |
      | 1234 | 6234  | +++  |
      | 1234 | 1298  | ++   |
      | 1234 | 1723  | +--  |
      | 1234 | 7123  | ---  |

    Scenarios: all numbers correct
      | code | guess | mark |
      | 1234 | 1234  | ++++ |
      | 1234 | 1243  | ++-- |
      | 1234 | 1423  | +--- |
      | 1234 | 4321  | ---- |

    Scenarios: matches with duplicates
      | code | guess | mark |
      | 1234 | 1155  | +    |
      | 1234 | 5115  | -    |
      | 1134 | 1155  | ++   |
      | 1134 | 5115  | +-   |

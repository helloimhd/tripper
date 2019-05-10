module ExpensesHelper

  def chartData
    [
          {name:"Paid",data: {"Spend":@paid}},
          {name:"Unpaid",data: {"Spend":@unpaid}},
          {name:"Total", data: {"Spend":@spend}},
          {name:"Budget", data: {"Spend":@budget}},
          {name:"Sav(Ovr)", data: {"Spend":(@budget-@spend)}}
        ]
  end
end
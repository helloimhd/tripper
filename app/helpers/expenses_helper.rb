module ExpensesHelper

  def stackChart
      [
          {name:"Paid",data: {"Spend":@paid}, stack:"Spend"},
          {name:"Unpaid",data: {"Spend":@unpaid}, stack: "Spend"},
          {name:"Budget", data: {"Spend":@budget}},
          {name:"Sav(Ovr)", data: {"Spend":(@budget-@spend)}, stack:"Spend"}
        ]
  end

#   def waterfallChart
#       [
#           {name:"Paid",data: {"Spend":@paid}, stack:"Spend"},
#           {name:"Unpaid",data: {"Spend":@unpaid}, stack: "Spend"},
#           {name:" ",data: {"Saving":(@unpaid+@paid)}, stack: "Saving"},
#           {name:"Sav(Ovr)", data: {"Saving":(@budget-@spend)}, stack:"Saving"},
#           {name:"Budget", data: {"Budget":@budget}}
#         ]
#   end

end
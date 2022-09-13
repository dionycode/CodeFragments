using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DelegateClassLibrary
{
    public class DelegateFunctionClass
    {
        public DelegateFunctionClass()
        {
            ItemPrices = new List<decimal>();
        }

        public List<decimal> ItemPrices { get; set; }

        public decimal ComputeSubTotal(Func<decimal[], decimal> myDelegateComputeSubTotal)
        {
            var subTotal = myDelegateComputeSubTotal(ItemPrices.ToArray());

            return subTotal;
        }
    }
}

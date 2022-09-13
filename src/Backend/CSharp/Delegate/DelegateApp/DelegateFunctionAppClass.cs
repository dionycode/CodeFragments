using DelegateClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DelegateApp
{
    public class DelegateFunctionAppClass
    {

        public DelegateFunctionAppClass()
        {
            AppItemPrices = new List<decimal>();
        }

        public List<decimal> AppItemPrices { get; set; }

        public decimal MyAppFunctionOneComputeSubTotal()
        {
            var myDelegateFunction = new DelegateFunctionClass();

            myDelegateFunction.ItemPrices = AppItemPrices;

            var subTotal = myDelegateFunction.ComputeSubTotal(MyAppFunctionOneActualComputeSubTotal);

            return subTotal;
        }   

        public decimal MyAppFunctionTwoComputeSubTotal()
        {
            var myDelegateFunction = new DelegateFunctionClass();

            myDelegateFunction.ItemPrices = AppItemPrices;

            var subTotal = myDelegateFunction.ComputeSubTotal(MyAppFunctionTwoActualComputeSubTotal);

            return subTotal;
        }




        /// <summary>
        /// 
        /// This is the actual method that is doing the computation
        /// It is passed as parameter to the ComputeSubTotal method in DelegateMethodClass class.
        /// 
        /// </summary>
        /// <param name="itemPrices"></param>
        /// <returns></returns>
        private decimal MyAppFunctionOneActualComputeSubTotal(decimal[] itemPrices)
        {
            return itemPrices.Sum();
        }

        /// <summary>
        /// 
        /// This is the actual method that is doing the computation
        /// It is passed as parameter to the ComputeSubTotal method in DelegateMethodClass class.
        /// 
        /// This will compute sum of prices that are greater than 5.
        /// 
        /// </summary>
        /// <param name="itemPrices"></param>
        /// <returns></returns>
        private decimal MyAppFunctionTwoActualComputeSubTotal(decimal[] itemPrices)
        {
            return itemPrices.Where(o => o > 5).Sum();
        }

      

    }
}

using DelegateClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DelegateApp
{
    public class DelegateMethodAppClass
    {

        public DelegateMethodAppClass()
        {
            AppItemPrices = new List<decimal>();
        }

        public List<decimal> AppItemPrices { get; set; }

        public decimal MyAppMethodOneComputeSubTotal()
        {
            var myDelegateMethod = new DelegateMethodClass();

            myDelegateMethod.ItemPrices = AppItemPrices;

            var subTotal = myDelegateMethod.ComputeSubTotal(MyAppMethodOneActualComputeSubTotal);

            return subTotal;
        }   

        public decimal MyAppMethodTwoComputeSubTotal()
        {
            var myDelegateMethod = new DelegateMethodClass();

            myDelegateMethod.ItemPrices = AppItemPrices;

            var subTotal = myDelegateMethod.ComputeSubTotal(MyAppMethodTwoActualComputeSubTotal);

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
        private decimal MyAppMethodOneActualComputeSubTotal(decimal[] itemPrices)
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
        private decimal MyAppMethodTwoActualComputeSubTotal(decimal[] itemPrices)
        {
            return itemPrices.Where(o => o > 5).Sum();
        }

      

    }
}

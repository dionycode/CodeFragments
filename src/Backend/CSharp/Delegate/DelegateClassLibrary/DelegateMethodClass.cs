namespace DelegateClassLibrary
{
    public class DelegateMethodClass
    {
        public DelegateMethodClass()
        {
            ItemPrices = new List<decimal>();
        }

        public delegate decimal MyDelegateComputeSubTotal(decimal[] prices);

        public List<decimal> ItemPrices { get; set; }

        public decimal ComputeSubTotal(MyDelegateComputeSubTotal myDelegateComputeSubTotal)
        {
            var subTotal = myDelegateComputeSubTotal(ItemPrices.ToArray());

            return subTotal;        
        }

    }
}

using DelegateClassLibrary;

var methodWithCallback = new DelegateCallbackFunctionClass();

methodWithCallback.LongRunningProcess(PrintProgressCallback);


static void PrintProgressCallback(int i)
{
    Console.WriteLine($"Current Counter {i}");
}


using MyWaterConsumption.ViewModels;

namespace MyWaterConsumption.Views;

public partial class History : ContentPage
{
	public History()
	{
		InitializeComponent();
		BindingContext = new HistoryViewModel();
	}
}
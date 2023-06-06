using MyWaterConsumption.Models;
using MyWaterConsumption.ViewModels;

namespace MyWaterConsumption.Views;

public partial class AddConsumption : ContentPage
{
    AddConsumptionViewModel viewModel;
    public AddConsumption()
    {
        InitializeComponent();
        viewModel = new AddConsumptionViewModel();
        BindingContext = viewModel;
    }

    Consumption _consumption;
    public Consumption consumption
    {
        get => _consumption;
        set
        {
            if (_consumption == value)
                return;

            _consumption = value;

            viewModel.id = _consumption.id.ToString();
            viewModel.consumption = _consumption.consumption.ToString();
            viewModel.dateTime = _consumption.dateTime.ToString();

        }
    }
}
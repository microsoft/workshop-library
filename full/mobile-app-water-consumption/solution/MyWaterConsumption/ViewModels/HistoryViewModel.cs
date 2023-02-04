using MyWaterConsumption.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace MyWaterConsumption.ViewModels
{
    public class HistoryViewModel
    {
        private ObservableCollection<Consumption> consumptions;


        public HistoryViewModel()
        {
            consumptions = new ObservableCollection<Consumption>();
            LoadDataCommand = new Command(async () => await LoadData());
            AddConsumptionCommand = new Command(async () => await Shell.Current.GoToAsync("//AddConsumption"));


            MessagingCenter.Subscribe<HistoryViewModel>(this, "refresh", async (sender) => await LoadData());

            Task.Run(LoadData);
        }

        public ICommand LoadDataCommand { get; private set; }
        public ICommand AddConsumptionCommand { get; private set; }


        public ObservableCollection<Consumption> Consumptions
        {
            get => consumptions;
            set => consumptions = value;
        }

        public async Task LoadData()
        {
            try
            {
                var consumptionCollection = await APIManager.GetAll();

                MainThread.BeginInvokeOnMainThread(() =>
                {
                    consumptions.Clear();

                    foreach (Consumption consumption in consumptionCollection)
                    {
                        consumptions.Add(consumption);
                    }
                });
            }
            catch
            {

            }
        }
    }
}

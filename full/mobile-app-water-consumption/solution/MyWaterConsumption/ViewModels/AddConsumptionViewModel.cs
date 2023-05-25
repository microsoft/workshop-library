using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace MyWaterConsumption.ViewModels
{
    public class AddConsumptionViewModel
    {
        public ICommand SaveCommand { get; private set; }

        string _id;
        public string id
        {
            get => _id;
            set => _id = value;
        }

        string _consumption;
        public string consumption
        {
            get => _consumption;
            set => _consumption = value;
        }

        string _dateTime;
        public string dateTime
        {
            get => _dateTime;
            set => _dateTime = value;
        }

        public AddConsumptionViewModel()
        {

            SaveCommand = new Command(async () => await SaveData());


        }

        private async Task SaveData()
        {
            if (string.IsNullOrWhiteSpace(id))

                await InsertPart();
            else
                SaveCommand.Execute(id);


        }

        private async Task InsertPart()
        {

            await APIManager.Add(Convert.ToInt32(id), Convert.ToInt32(consumption), Convert.ToDateTime(dateTime).ToUniversalTime());

            MessagingCenter.Send(this, "refresh");

            await Shell.Current.GoToAsync("//History");
        }
    }
}

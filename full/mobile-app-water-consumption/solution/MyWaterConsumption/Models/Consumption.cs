using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyWaterConsumption.Models
{
    public class Consumption
    {
        public int id { get; set; }
        public int consumption { get; set; }
        [DataType(DataType.Date)]
        public DateTime dateTime { get; set; }
    }
}

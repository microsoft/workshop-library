// new WaterConsumptionItemModel() { DateTime = DateTimeOffset.Parse("2022-10-01T00:00:00Z"), Consumption = 100 }
namespace API.Models;
using Microsoft.EntityFrameworkCore;

class WaterConsumptionDb : DbContext
{
    public WaterConsumptionDb(DbContextOptions options) : base(options) { 
       
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        // new DbInitializerConsumption(modelBuilder).Seed();
    }
    public DbSet<WaterEntry> WaterEntry { get; set; } = null!;
}

public class WaterEntry
{
  public int Id { get; set; }
  public DateTime DateTime { get; set; }
  public int Consumption { get; set; }
}

public class DbInitializerConsumption
{
    private readonly ModelBuilder modelBuilder;

    public DbInitializerConsumption(ModelBuilder modelBuilder)
    {
        this.modelBuilder = modelBuilder;
    }

    public void Seed()
    {
        modelBuilder.Entity<WaterEntry>().HasData(
               new WaterEntry() { Id = 1, DateTime = DateTime.Parse("2022-10-01T00:00:00Z"), Consumption = 100 },
               new WaterEntry() { Id =2, DateTime = DateTime.Parse("2022-10-01T00:10:00Z"), Consumption = 110 },
                new WaterEntry() { Id = 3, DateTime = DateTime.Parse("2022-10-01T00:20:00Z"), Consumption = 120 },
                new WaterEntry() { Id = 4, DateTime = DateTime.Parse("2022-10-01T00:30:00Z"), Consumption = 130 },
                new WaterEntry() { Id = 5, DateTime = DateTime.Parse("2022-10-01T00:40:00Z"), Consumption = 140 },
                new WaterEntry() { Id = 6, DateTime = DateTime.Parse("2022-10-01T00:50:00Z"), Consumption = 150 },
                new WaterEntry() { Id = 7, DateTime = DateTime.Parse("2022-10-01T01:00:00Z"), Consumption = 100 },
                new WaterEntry() {Id = 8, DateTime = DateTime.Parse("2022-10-01T01:10:00Z"), Consumption = 110 },
                new WaterEntry() { Id = 9, DateTime = DateTime.Parse("2022-10-01T01:20:00Z"), Consumption = 120 },
                new WaterEntry() { Id = 10, DateTime = DateTime.Parse("2022-10-01T01:40:00Z"), Consumption = 140 },
                new WaterEntry() { Id = 11, DateTime = DateTime.Parse("2022-10-01T01:50:00Z"), Consumption = 150 },
                new WaterEntry() { Id = 12, DateTime = DateTime.Parse("2022-10-01T02:00:00Z"), Consumption = 100 },
                new WaterEntry() { Id = 13, DateTime = DateTime.Parse("2022-10-01T02:10:00Z"), Consumption = 110 },
                new WaterEntry() { Id = 14, DateTime = DateTime.Parse("2022-10-01T02:20:00Z"), Consumption = 120 },
                new WaterEntry() { Id = 15, DateTime = DateTime.Parse("2022-10-01T02:30:00Z"), Consumption = 130 },
                new WaterEntry() { Id = 16, DateTime = DateTime.Parse("2022-10-01T02:40:00Z"), Consumption = 140 },
                new WaterEntry() { Id = 17, DateTime = DateTime.Parse("2022-10-01T02:50:00Z"), Consumption = 150 },
                new WaterEntry() { Id = 18, DateTime = DateTime.Parse("2022-10-01T03:00:00Z"), Consumption = 100 },
                new WaterEntry() { Id = 19, DateTime = DateTime.Parse("2022-10-01T03:10:00Z"), Consumption = 110 },
                new WaterEntry() { Id = 20, DateTime = DateTime.Parse("2022-10-01T03:20:00Z"), Consumption = 120 },
                new WaterEntry() { Id = 21, DateTime = DateTime.Parse("2022-10-01T03:30:00Z"), Consumption = 130 },
                new WaterEntry() { Id = 22, DateTime = DateTime.Parse("2022-10-01T03:40:00Z"), Consumption = 140 },
                new WaterEntry() { Id = 23, DateTime = DateTime.Parse("2022-10-01T03:50:00Z"), Consumption = 150 }
        );
    }
}
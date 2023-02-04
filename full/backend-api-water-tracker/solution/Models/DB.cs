// namespace API.Models;
// using Microsoft.EntityFrameworkCore;

// class ResumeDb : DbContext
// {
//   public ResumeDb(DbContextOptions options) : base(options) { }

//   protected override void OnModelCreating(ModelBuilder modelBuilder)
//   {
//     base.OnModelCreating(modelBuilder);
//     new DbInitializer(modelBuilder).Seed();
//   }
//   public DbSet<Education> Educations { get; set; } = null!;
//   public DbSet<Skill> Skills { get; set; } = null!;
//   public DbSet<Experience> Experiences { get; set; } = null!;
//   public DbSet<Resume> Resumes { get; set; } = null!;
// }

// public class DbInitializer
// {
//   private readonly ModelBuilder modelBuilder;

//   public DbInitializer(ModelBuilder modelBuilder)
//   {
//     this.modelBuilder = modelBuilder;
//   }

//   public void Seed()
//   {
//     modelBuilder.Entity<Resume>().HasData(
//            new Resume() { Id = 1, Name = "Chris" }
//     );

//     modelBuilder.Entity<Skill>().HasData(
//            new Skill() { Id = 1, Name = ".NET", EstimatedDescription = ".NET", EstimatedLevel = 5, ResumeId = 1 }
//     );
//     modelBuilder.Entity<Education>().HasData(
//            new Education() { Id = 1, Name = "BSC Computer Science", DegreeYear = "2020", Description = "Bachelor in computer science", ResumeId = 1  }
//     );

//     modelBuilder.Entity<Experience>().HasData(
//            new Experience() { Id = 1, CompanyName = "Microsoft", Tenure = "2020-2022", Title = "Developer", Description = "Developer in a team of 5", ResumeId = 1 }
//     );
//   }
// }

// class Education
// {
//   public int Id { get; set; }
//   public string Name { get; set; }
//   public string DegreeYear { get; set; }
//   public string Description { get; set; }
//   public int ResumeId { get; set; }
// };

// class Experience
// {
//   public int Id { get; set; }
//   public string CompanyName { get; set; }
//   public string Title { get; set; }
//   public string Tenure { get; set; }
//   public string Description { get; set; }
//   public int ResumeId { get; set; }
// };

// class Skill
// {
//   public int Id { get; set; }
//   public string Name { get; set; }
//   public int EstimatedLevel { get; set; }
//   public string EstimatedDescription { get; set; }
//   public int ResumeId { get; set; }
// }
// class Resume
// {
//   public int Id { get; set; }
//   public string Name { get; set; }
//   public ICollection<Education> Educations { get; set; }
//   public ICollection<Experience> Experiences { get; set; }
//   public ICollection<Skill> Skills { get; set; }
// };
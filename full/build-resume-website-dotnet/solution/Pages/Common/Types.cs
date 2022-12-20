namespace Types;

public class ResumeModel {
  public string? About { get; set; }
  public List<ExperienceModel>? Experiences { get; set; }
  public List<EducationModel>? Educations { get; set; }

  public List<SkillModel>? Skills { get; set; }
}
public class ExperienceModel
{
  public string? CompanyName { get; set; }
  public string? Tenure { get; set; }

  public string? Description { get; set; }
  public string? Title { get; set; }
}

public class EducationModel
{
  public string? Name { get; set; }
  public string? DegreeYear { get; set; }
  public string? Description { get; set; }
}

public class SkillModel
{
  public string? Name { get; set; }
  public int? EstimatedLevel { get; set; }
  public string? EstimatedDescription { get; set; }
}



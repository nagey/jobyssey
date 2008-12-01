class SearchController < ApplicationController
  
    before_filter :authenticate
  
  def all_professionals
    @professionals = Professional.find :all
    @skills = Skill.find :all
    session[:job_posting] = JobPosting.find_by_id params[:id] unless params[:id].nil?
  end
    
  def all_jobs
    @employers = Employer.find :all
    @skills = Skill.find :all
  end

  def distance(a,d,c1=0)
    @a = a
    @b = d
    if d.length != a.length
      return -1
    end
    c = 0
    a.length.times do |x|
      c += (a[x]-d[x])**2
      if c1!=0 and c1<c
        return c1
      end
    end
    c = Math.sqrt(c)
    return c
  end

  def find_matching_jobs
    #define professionals' skills position
    p = session[:user]
    professional_skills_position = []
    p.personal_qualities.each do |s|
       if s.metric.class == Skill
         unless s.value.nil?
           professional_skills_position << s.value
          end
         if s.value.nil?
           professional_skills_position << 0
         end
       end
    end
    #define professionals' personality position
    professional_personality_position = []
    p.personal_qualities.each do |t| #we should give profs and jobs all traits set to 50 when created, so they will have them all even if they skip the personality page
      if t.metric.class == Trait
        professional_personality_position << t.value
      end
    end
    #for each job, create skills position, find % match 
    #job= JobPosting.find_by_id 1
    jobs = JobPosting.find :all
    @jobs_list = []
    for job in jobs
    job_skills_position = []
      p.personal_qualities.each do |s|
        if s.metric.class == Skill
          if job.job_posting_requirements.exists?(:metric_id => s.metric.id)
            j = JobPostingRequirement.find_by_job_posting_id_and_metric_id(job, s.metric)
            job_skills_position << j.value
          else
            job_skills_position << 0
          end
        end
      end
      #Calculate position relative to professional skills position here, add job and distance or percentage to results array
      skills_distance = distance(professional_skills_position, job_skills_position)
      total_skills= Math.sqrt(professional_skills_position.length*10000)
      skills_total = (skills_distance/total_skills)*100
      skills_percent = 100 - skills_total
      
      #find personality position and % match.
      job_personality_position =[]
      p.personal_qualities.each do |t|
        if t.metric.class == Trait
          if job.job_posting_requirements.exists?(:metric_id => t.metric.id)
            j = JobPostingRequirement.find_by_job_posting_id_and_metric_id(job, t.metric)
            job_personality_position << j.value
          else
            job_personality_position << 50
          end
        end
      end
      personality_distance = distance(professional_personality_position, job_personality_position)
      #If we change the number of personality metrics this line needs to be changed!
      personality_percent = (personality_distance/447)*100
      
  
      job_rank = [job, skills_percent, personality_percent]
      @jobs_list << job_rank

  end
    
    #Sort results by skill %. 
    @jobs_list.sort_by { |job| job[1] }
    @jobs_list.reverse!
  end
  
  def find_matching_professionals
    #define jobs skills position
    j = JobPosting.find_by_id params[:id]
    @job = j
    job_skills_position = []
    j.job_posting_requirements.each do |s|
       if s.metric.class == Skill
         unless s.value.nil?
           job_skills_position << s.value
          end
         if s.value.nil?
           job_skills_position << 0
         end
       end
    end
    #define jobs personality position
    job_personality_position = []
    j.job_posting_requirements.each do |t| #we should give profs and jobs all traits set to 50 when created, so they will have them all even if they skip the personality page
      if t.metric.class == Trait
        job_personality_position << t.value
      end
    end
    #for each professional, create skills position, find % match 
    professionals = Professional.find :all
    @professionals_list = []
    for professional in professionals
    professional_skills_position = []
      j.job_posting_requirements.each do |s|
        if s.metric.class == Skill
          if professional.personal_qualities.exists?(:metric_id => s.metric.id)
            p = PersonalQuality.find_by_user_id_and_metric_id(professional, s.metric)
            professional_skills_position << p.value
          else
            professional_skills_position << 0
          end
        end
      end
      #Calculate position relative to job skills position here, add job and distance or percentage to results array
      skills_distance = distance(job_skills_position, professional_skills_position)
      total_skills= Math.sqrt(job_skills_position.length*10000)
      skills_total = (skills_distance/total_skills)*100
      skills_percent = 100 - skills_total
      
      #find personality position and % match.
      professional_personality_position =[]
      j.job_posting_requirements.each do |t|
        if t.metric.class == Trait
          if professional.personal_qualities.exists?(:metric_id => t.metric.id)
            p = PersonalQuality.find_by_user_id_and_metric_id(professional, t.metric)
            professional_personality_position << p.value
          else
            professional_personality_position << 50
          end
        end
      end
      personality_distance = distance(job_personality_position, professional_personality_position)
      #If we change the number of personality metrics this line needs to be changed!
      personality_percent = (personality_distance/447)*100
      
  
      professional_rank = [professional, skills_percent, personality_percent]
      @professionals_list << professional_rank

  end
    
    #Sort results by skill %. 
    @professionals_list.sort_by { |job| job[1] }
    @professionals_list.reverse!
  end

end



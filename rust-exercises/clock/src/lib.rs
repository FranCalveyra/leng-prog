use std::fmt;

#[derive(PartialEq, PartialOrd, Debug)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let clock = Self {hours:0, minutes:0};
        clock.add_minutes((hours * 60) + minutes)
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let total_minutes = self.hours * 60 + self.minutes + minutes;
        let mut hours = 0;
        let mut result_minutes = 0;

        if self.hours == 0{
            let additional = if total_minutes < 0 {24 * 60} else {0};
            let final_time = additional + total_minutes;
            hours = final_time / 60;
            result_minutes = final_time % 60;
        }
        else{
            hours = total_minutes / 60;
            result_minutes = total_minutes % 60; 
        }

        while hours < 0 {
            hours += 24;
        }

        while result_minutes < 0 {
            result_minutes +=60;
        }

        if hours >= 24{
            hours = hours % 24;
        }

        if result_minutes >= 60{
            hours += result_minutes / 60;
            result_minutes = result_minutes % 60;
        }

        

        Self {hours: hours, minutes: result_minutes} 
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}:{}", format_time(self.hours), format_time(self.minutes))
    }
}

fn format_time(time: i32) -> String {
    if time < 10 {"0".to_owned() + &time.to_string()} else {time.to_string()}    
}

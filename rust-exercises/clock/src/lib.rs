use std::fmt;

#[derive(PartialEq, PartialOrd, Debug)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let clock = Self {hours:24, minutes:0};
        clock.add_minutes(hours * 60 + minutes)
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let total_minutes = self.hours * 60 + self.minutes + minutes;
        let mut mins = total_minutes % (24 * 60);
        
        if mins < 0{
            mins += 24 * 60
        }

        let hours = mins / 60;
        let res_mins = mins % 60;
        
        Self { hours, minutes: res_mins }
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

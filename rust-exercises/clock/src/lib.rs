use std::fmt;

#[derive(PartialEq, PartialOrd, Debug)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Self {hours: hours, minutes: minutes}
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let mut new_minutes = self.minutes + minutes;
        let mut hours = 0; 
        
        if new_minutes < 0{
            let whole_minutes = (self.hours * 60) + new_minutes;
            hours = whole_minutes / 60;
            new_minutes = whole_minutes % 60;
        }

        if new_minutes >=60{
            hours = new_minutes / 60;
            new_minutes = new_minutes % 60;
        }
        
        let result_hours = if hours != 0 {self.hours + hours} else {self.hours};
        
        Self::new(result_hours, new_minutes)
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}:{}", self.hours, self.minutes)
    }
}

#[derive(Debug, PartialEq)]
pub enum Error {
    EmptyBuffer,
    FullBuffer,
}

pub struct CircularBuffer<T:Clone> {
    buffer: Vec<Option<T>>,
    size: usize,
    next: usize,
    read: usize,
}

impl<T:Clone> CircularBuffer<T> {
    pub fn new(size: usize) -> CircularBuffer<T> {
        CircularBuffer {
            buffer: vec![None; size],
            size: 0,
            next: 0,
            read: 0,
        }
    }

    pub fn read(&mut self) -> Result<T, Error> {
        if self.is_empty() {return Err(Error::EmptyBuffer);}
        let elem = self.buffer[self.read].clone();
        self.buffer[self.read] = None;
        self.read = self.alter_next_index(self.read);
        println!("Current value of read index: {}", self.read);


        self.size -=1; 
        Ok(elem.as_ref().unwrap().clone())

    }

    pub fn write(&mut self, byte: T) -> Result<(), Error> {
        if self.is_full() {return Err(Error::FullBuffer);}
        self.buffer[self.next] = Some(byte);
        self.next = self.alter_next_index(self.next);
        println!("Current write index value: {}", self.next);
        self.size +=1;
        Ok(())
    }

    pub fn clear(&mut self) {
        self.buffer = vec![None; self.buffer.capacity()];
        self.next = 0;
        self.size = 0;
        self.read = 0;
    }

    pub fn is_empty(&self) -> bool {
        self.size == 0
    }

    pub fn is_full(&self) -> bool {
        self.size == self.buffer.capacity()
    }
    
    fn alter_next_index(&mut self, index: usize) -> usize {
        if index + 1 < self.buffer.capacity() {
            index + 1
        }

        else {
            (index + 1) % self.buffer.capacity()
        }
    }
}

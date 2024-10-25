#[derive(Debug)]
pub struct ChessPosition(i32, i32);

#[derive(Debug)]
pub struct Queen {
    position: ChessPosition
}

impl ChessPosition {
    pub fn new(rank: i32, file: i32) -> Option<Self> {
        if rank < 0 || file < 0 || rank >=8 || file >=8 {return None};
        Some(ChessPosition(rank, file))
    }
}

impl Queen {
    pub fn new(position: ChessPosition) -> Self {
        Queen {position}
    }

    pub fn can_attack(&self, other: &Queen) -> bool {
    let same_row = self.position.0 == other.position.0;
    let same_col = self.position.1 == other.position.1;

    let delta_col = (self.position.1 - other.position.1).abs();
    let delta_row = (self.position.0 - other.position.0).abs();

        same_row || same_col || delta_col == delta_row
    }   
}

use std::collections::HashMap;
use std::f64::consts::PI;

struct Point(f64, f64);

struct Canvas{
    width: f64,
    height:f64,
    shapes: HashMap<Point, Box<dyn Shape>>
}

impl Canvas {
    pub fn new(width: f64, height:f64) -> Self{
        Canvas{width, height, shapes:HashMap::new()}
    }

    pub fn add(&mut self, place: Point, shape: Box<dyn Shape>) {
        if self.is_outside_canvas(&place) {panic!("Point is outside canvas")}
        self.shapes.insert(place, shape);
    }

    pub fn sum_areas(&self) -> f64 {
        self.shapes.values().fold(0.0, |acc,s| acc + (*s.area()))
    }

    pub fn shift_all(&mut self, shift_x: f64, shift_y:f64) -> bool{
        let new_shapes =  self.shapes.iter().map(|(mut p,s)| {
            *p.0 += shift_x; *p.1 += shift_y; }).collect();

        if self.shapes.keys().any(|p| self.is_outside_canvas(&p)) {return false}
        self.shapes = new_shapes;
        true
    }

    fn is_outside_canvas(&self, point: &Point) -> bool{
        point.0 <=0.0 || point.0 > self.width || point.1 <=0.0 || point.1 > self.height
    }
}


trait Shape {
    fn area(&self) -> f64;
    fn container_box(&self, center: &Point) -> (Point, Point);
}

struct Circle{ radius: f64 }
struct Rectangle {width: f64, height:f64,}

impl Shape for Circle {
    fn area(&self) -> f64 {
        (self.radius ** 2) * PI
    }

    fn container_box(&self, center: &Point) -> (Point, Point) {
        let x: Point = Point(center.0 - self.radius, center.1 - self.radius);
        let y: Point = Point(center.0 + self.radius, center.1 + self.radius);
        (x,y)
    }
}

impl Shape for Rectangle {
    fn area(&self) -> f64 {
        self.width * self.height
    }

    fn container_box(&self, center: &Point) -> (Point, Point) {
        let x: Point = Point(center.0 - self.width/ 2.0, center.1 - self.height/ 2.0);
        let y: Point = Point(center.0 + self.width/ 2.0, center.1 + self.height/ 2.0);
        (x,y)
    }
}

fn main(){}
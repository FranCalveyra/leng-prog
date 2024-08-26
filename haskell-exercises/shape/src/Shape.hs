module Shape where

data Point = Point { x::Double, y:: Double} deriving (Eq, Show)

data Circle    = Circle    Point Double deriving (Eq, Show)
data Rectangle = Rectangle Point Point deriving (Eq, Show)


-- A point from a tuple Pair
point::(Double, Double) -> Point
point (a,b) = Point{x=a, y=b}

-- The origin
origin::Point
origin = Point{x=0.0, y=0.0}

-- Rectangle from a Tuple where (x0 y0) == origin
rectangle::(Double, Double) -> Rectangle
rectangle (width, length) = Rectangle origin (point (width, length))

base::Rectangle -> Double
base (Rectangle _ Point{x=b, y=_}) = b

height::Rectangle -> Double
height (Rectangle _ Point{x=_, y=h}) = h

-- Circle from radius
circle::Double -> Circle
circle r = Circle origin r

-- Clase Shift

class Shift a where
   shift::a -> (Double, Double) -> a
   
instance Shift Point where
   shift Point{x=x1,y=y1} (a,b) = Point{x= x1 + a , y= y1 + b}
   
instance Shift Rectangle where
   shift (Rectangle Point{x=b0, y=h0} Point{x=b,y=h}) (x1,y1) = Rectangle Point{x=b0+x1, y=h0+y1} Point{x=b+x1, y=h+y1}
   
instance Shift Circle where
   shift (Circle Point{x=a, y=b} r) (x1,y1) = Circle Point{x=a+x1, y=b+y1} r
   
-- Define the Surface class

class Surface a where
  surface::a -> Double

instance Surface Circle where
  surface (Circle _ r) = pi * (r^2)

instance Surface Rectangle where
  surface (Rectangle Point{x=b0, y=h0} Point{x=b, y=h}) = abs (b-b0)*(h-h0)


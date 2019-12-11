defmodule Points do
  def draw(:l) do
    [
      {2, 1}, 
      {2, 2},
      {2, 3},
      {3, 3}, 
    ]
    
  end
  def draw(:o) do
    [
      {2, 2},
      {2, 3},
      {3, 2},
      {3, 3},
    ]    
  end
  def draw(:i) do
    [
      {1, 2},
      {2, 2},
      {3, 2},
      {4, 2},
    ]    
  end
  def draw(:t) do
    [
      {2, 2},
      {3, 2},
      {4, 2},
      {3, 3},
    ]    
  end
  def draw(:z) do
    [
      {2, 2},
      {2, 3},
      {3, 3},
      {3, 4},
    ]    
  end
  
  def rotate(points, degrees) do
    do_fn(points, fn(point) -> rotate_point(point, degrees) end)
  end
  
  def rotate_point(point, 90) do
    point
    |> mirror_point
    |> transpose_point
  end
  def rotate_point(point, 180) do
    point
    |> rotate_point(90)
    |> rotate_point(90)
  end
  def rotate_point(point, 270) do
    point
    |> rotate_point(90)
    |> rotate_point(180)
  end
  def rotate_point(point, 0) do
    point
  end
  
  def mirror_point({x, y}) do
    {5-x, y}
  end  
  
  def flip_point({x, y}) do
    {x, 5-y}
  end  
  
  def transpose_point({x, y}) do
    {y, x}
  end  
  
  def do_fn(points, f) do
    Enum.map(points,f)
  end
  
  def mirror(points) do
    do_fn points, &mirror_point/1
  end
  
  def flip(points) do
    do_fn points, &flip_point/1
  end
  
  def transpose(points) do
    do_fn points, &transpose_point/1
  end
end
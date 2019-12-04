defmodule Tetris.Brick do
  defstruct [:name, :top_left, :rotation, :reflection]
  
  def new do
    %__MODULE__{
      name: :o,
      top_left: {0,0},
      rotation: 90,
      reflection: true 
    }
    
  end
  def toggle(true) do
    false
  end
  def toggle(false) do
    true
  end
  
  def reflect(brick) do
    %{brick| reflection: toggle(brick.reflection)}
  end
  
  def turn(90) do
    180
  end
  def turn(180) do
    270
  end
  def turn(270) do
    0
  end
  def turn(0) do
    90
  end
  
  def rotate(brick) do
    %{brick| rotation: turn(brick.rotation)}
  end
  
  def right({x, y}) do
    {x+1, y}
  end
  def move_right(brick) do
    %{brick| top_left: right(brick.top_left)}
  end
  def left({x, y}) do
    {x-1, y}
  end
  def move_left(brick) do
    %{brick| top_left: left(brick.top_left)}
  end
  def down({x, y}) do
    {x, y+1}
  end
  def move_down(brick) do
    %{brick| top_left: down(brick.top_left)}
  end
end
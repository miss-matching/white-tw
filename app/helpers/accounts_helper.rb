module AccountsHelper
  # NOTE: ActiveDecorator的な何かを使った方がいいかも。検討。
  def prefix_screen_name( screen_name )
    screen_name.nil? ? nil : '@' + screen_name
  end
end

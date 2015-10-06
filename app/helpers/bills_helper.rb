module BillsHelper

  def plural_ownership(object_count, string)
    if object_count > 1
      return string + "s'"
    else
      return string + "'s"
    end
  end

end

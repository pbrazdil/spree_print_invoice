def supplier_info(d)
  col1 = [d[:name], d[:address], d[:city], d[:country]]
  col2 = [ "#{Spree.t(:ic)}: #{d[:ic]}", "#{Spree.t(:dic)}: #{d[:dic]}", "#{Spree.t(:bank_account)}:", "#{d[:bank_account]}"]

  print_col = -> (data) { data.inject { |res, s| res + "\n" + s } }

  [print_col.call(col1), print_col.call(col2)]
end


data = [
  [Spree.t(:supplier)],
  supplier_info(Spree::PrintInvoice::Config[:company_details])
]

move_down 75
table(data, :width => 350) do
  row(0).font_style = :bold
  row(0).column(0).borders = [:top, :right, :bottom, :left]
  row(0).column(0).border_widths = [0, 0, 0, 0]
  row(0).column(1).borders = [:top, :right, :bottom, :left]
  row(0).column(1).border_widths = [0, 0, 0, 0]
  row(1).column(0).borders = [:top, :right, :bottom, :left]
  row(1).column(0).border_widths = [0, 0, 0, 0]
  row(1).column(1).borders = [:top, :right, :bottom, :left]
  row(1).column(1).border_widths = [0, 0, 0, 0]
end
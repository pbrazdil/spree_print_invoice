INSTALLATION
============

1. The gem relies only on the prawn gem, to install you need to add the following lines to your Gemfile

  ```ruby
  gem 'spree_print_invoice' , github: 'pbrazdil/spree_print_invoice'
  ```

2. Run bundler

  ```shell
  $ bundle install
  ```

3. Install migration

  ```shell
  $ rails g spree_print_invoice:install
  ```

4. Enjoy! Now allow to generate invoices with sequential numbers


Configuration
==============

1. Set the logo path preference to include your store / company logo. Logo must be within project assets.

  ```ruby
  Spree::PrintInvoice::Config.set(print_invoice_logo_path: "logo/company-logo.png")
  ```

2. Add your own own footer texts to the locale. The current footer works with `:footer_center` 

3. Override any of the partial templates. They are address, footer, totals, header, bye, and the line_items. In bye the text `:thanks` is printed. The `:extra_note` hook has been deprecated as Spree no longer supports hooks.

4. Set `:suppress_anonymous_address` option to get blank addresses for anonymous email addresses (as created by my spree_last_address extension for empty/unknown user info)

5. Many european countries requires numeric and sequential invoices numbers. To use invoices sequential number fill the specific field in "General Settings" or by set
  
  ```ruby
  Spree::PrintInvoice::Config.set(print_invoice_next_number: [1|{your current next invoice number}])
  ```

 The next invoice number will be the one that you specified. You will able to increase it in any moment, for example, to re-sync invoices number if you are making invoices also in other programs for the same business name.

6. Enable packaging slips, by setting

  ```ruby
  Spree::PrintInvoice::Config.set(print_buttons: "invoice,packaging_slip")  #comma separated list
  ```

 Use above feature for your own template if you want. For each button_name, define `button_name_print` text in your locale.

7. Set page/document options with

  ```ruby
  Spree::PrintInvoice::Config.set(prawn_options: { page_layout: :landscape, page_size: "A4", margin: [50, 100, 150, 200] })
  ```
  
8. Set company details which will be printed on invoice.
  ```ruby
  Spree::PrintInvoice::Config.set(company_details = {
                                        :name => '...',
                                        :address => '...',
                                        :city => '...',
                                        :country => '...',
                                        :ic => '...',
                                        :dic => '...',
                                        :bank_account => '...'
                                    })
  ```

9. In order to have support for unicode characters set your own `font_face` (into `print_invoice_font_face`) and `font_family` (into `print_invoice_font_family`).


ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do

        panel "Info" do
          para "Welcome to Vendotron Administration."
        end

        panel "Recent Purchases" do
          ul do
            Purchase.order_by(created_at: -1).limit(10).each do |purchase|
              li do
                span link_to(purchase.customer.email, admin_customer_path(purchase.customer))
                span " bought a "
                span link_to(purchase.item.name, admin_item_path(purchase.item))
                span " for "
                span link_to(number_to_currency(purchase.purchase_price), admin_purchase_path(purchase))
                span time_ago_in_words(purchase.created_at)
                span " ago"
              end
            end
          end
        end

      end
    end

  end # content
end

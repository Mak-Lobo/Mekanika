class PagesController < ApplicationController
  allow_unauthenticated_access only: %i[ register about ]
  before_action :require_admin, only: :home

  def register
  end

  def home
    @name = "Mekanika"
    @total_users = User.where(admin: false).count
    @active_services = Service.where(active: true).count
    @total_services = Service.count
    @active_service_list = Service.where(active: true).limit(8)

    # Sample dashboard data until transactions and feedback have their own models.
    @dashboard_metrics = [
      { label: "Sample revenue", value: "KSh 486,750", detail: "+12.8% this month", icon: "fa-sack-dollar", tone: "cyan" },
      { label: "Sample transactions", value: "86", detail: "14 awaiting review", icon: "fa-receipt", tone: "blue" },
      { label: "Completion rate", value: "92%", detail: "+4.6% this month", icon: "fa-chart-line", tone: "emerald" }
    ]

    @recent_feedback = [
      { name: "Brian K.", vehicle: "Toyota Harrier", rating: 5, comment: "Clear diagnosis, fair pricing, and the car was ready exactly when promised." },
      { name: "Mercy W.", vehicle: "Mazda CX-5", rating: 4, comment: "The team handled the AC service quickly and explained every step." },
      { name: "David O.", vehicle: "Subaru Forester", rating: 5, comment: "Excellent suspension work. The vehicle feels stable and smooth again." },
      { name: "Aisha N.", vehicle: "Nissan X-Trail", rating: 5, comment: "Friendly service and transparent communication from inspection to collection." }
    ]

    @recent_activity = [
      { label: "New customer registration", detail: "Account created", time: "12 minutes ago", icon: "fa-user-plus" },
      { label: "Brake Pad Replacement", detail: "Service marked complete", time: "48 minutes ago", icon: "fa-circle-check" },
      { label: "Payment recorded", detail: "Sample transaction: KSh 18,500", time: "1 hour ago", icon: "fa-money-bill-wave" },
      { label: "Customer feedback received", detail: "5-star review", time: "2 hours ago", icon: "fa-star" }
    ]
  end

  def about
  end

  private

  def require_admin
    redirect_to about_path, alert: "Admin access is required." unless Current.user&.admin?
  end
end

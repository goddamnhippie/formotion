class AppDelegate

  attr_accessor :view_controller
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    form = Formotion::Form.new({
      sections: [{
        title: "Register",
        rows: [{
          title: "Photo",
          key: :photo,
          type: :image
        },{
          title: "Picker",
          key: :pick,
          type: :picker,
          items: ["Ruby", "Motion", "Rocks"],
          value: "Motion"
        },{
          title: "Email",
          key: :email,
          placeholder: "me@mail.com",
          type: :email,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "Password",
          key: :password,
          placeholder: "required",
          type: :string,
          secure: true
        }, {
          title: "Password",
          subtitle: "Confirmation",
          key: :confirm,
          placeholder: "required",
          type: :string,
          secure: true
        }, {
          title: "Switch",
          key: :switch,
          type: :switch,
        }, {
          title: "Bio",
          key: :bio,
          type: :text,
          placeholder: "Enter your Bio here...",
          rowHeight: 100
        }, {
          title: "Date Full",
          value: 326937600,
          key: :date_full,
          type: :date,
          format: :full
        }, {
          title: "Date Short",
          placeholder: "03/26/92",
          key: :date_short,
          type: :date,
          format: :short
        }, {
          title: "Account type",
          type: :subform,
          key: :account,
          subform: {
            title: "Account Type",
            sections: [{
              key: :type,
              select_one: true,
              rows: [{
                title: "Free",
                key: :free,
                type: :check,
              }, {
                title: "Basic",
                value: true,
                key: :basic,
                type: :check,
              }, {
                title: "Pro",
                key: :pro,
                type: :check,
              }]
            }, {
              rows: [{
                title: "Advanced",
                type: :subform,
                key: :advanced,
                subform: {
                  title: "Advanced",
                  sections: [{
                    key: :currency,
                    select_one: true,
                    rows: [{
                      title: "USD",
                      value: true,
                      key: :usd,
                      type: :check,
                    }, {
                      title: "EUR",
                      key: :eur,
                      type: :check,
                    }, {
                      title: "CHF",
                      key: :chf,
                      type: :check,
                    }]
                  }, {
                    rows: [{
                      title: 'Back',
                      type: :back
                    }]
                  }]
                }
              }]
            }, {
              rows: [{
                title: 'Back',
                type: :back
              }]
            }]
          }
        }]
      }, {
        rows: [{
          title: "Sign Up",
          type: :submit,
        }]
      }]
    })

    @view_controller = Formotion::FormController.alloc.initWithForm(form)
    @view_controller.form.on_submit do |form|
        p @view_controller.form.render
      end

    @window.rootViewController = @view_controller
    @window.makeKeyAndVisible
    true
  end
end

require "rails_helper"

describe BootstrapBuilders::Button do
  let(:user) { create :user }

  it "supports arguments given in both array and hash style" do
    visit arguments_bootstrap_builders_buttons_path
    button = find(".bb-btn")

    expect(button[:class]).to eq "btn btn-default btn-lg bb-btn"
    expect(button.text).to eq "Arguments label"
    expect(button[:href]).to eq "/arguments/url"
    expect(button["data-confirm"]).to eq "Are you sure?"
    expect(page).to have_http_status(:success)
    expect(current_path).to eq arguments_bootstrap_builders_buttons_path
  end

  it "#bb_destroy_btn" do
    visit destroy_btn_bootstrap_builders_buttons_path(user_id: user.id)

    button = find(".bb-btn-destroy")
    expect(button[:href]).to eq "/test/destroy"
    expect(button.text).to eq "Delete"

    icon = find(".bb-btn-destroy i")
    expect(icon[:class]).to eq "fa fa-remove"
  end

  it "#bb_edit_btn" do
    visit edit_btn_bootstrap_builders_buttons_path(user_id: user.id)

    button = find(".bb-btn-edit")
    expect(button[:href]).to eq "/test/edit"
    expect(button.text).to eq "Edit"

    icon = find(".bb-btn-edit i")
    expect(icon[:class]).to eq "fa fa-wrench"
  end

  it "#bb_new_btn" do
    visit new_btn_bootstrap_builders_buttons_path

    button = find(".bb-btn-new-user")
    expect(button[:href]).to eq "/test/new"
    expect(button.text).to eq "Add new"

    icon = find(".bb-btn-new-user i")
    expect(icon[:class]).to eq "fa fa-pencil"
  end

  it "#bb_show_btn" do
    visit show_btn_bootstrap_builders_buttons_path(user_id: user.id)

    button = find(".bb-btn-show-user")
    expect(button[:href]).to eq "/test/show"
    expect(button.text).to eq "Show"

    icon = find(".bb-btn-show-user i")
    expect(icon[:class]).to eq "fa fa-square-o"
  end
end

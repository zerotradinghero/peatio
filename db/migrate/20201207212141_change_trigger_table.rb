class ChangeTriggerTable < ActiveRecord::Migration[5.2]
  def up
    add_column :triggers, :market_id, :string, limit: 20, null: false, after: :id
    add_column :triggers, :member_id, :integer, null: false, after: :market_id
    add_column :triggers, :trigger_price, :decimal, precision: 32, scale: 16, default: '0.0', null: false, after: :order_id
    add_column :triggers, :amount, :decimal, precision: 32, scale: 16, default: '0.0', null: false, after: :trigger_price 
    add_column :triggers, :execution_price, :decimal, precision: 32, scale: 16, default: '0.0', after: :amount
    add_column :triggers, :locked, :decimal, precision: 32, scale: 16, default: '0.0', null: false, after: :execution_price
    add_column :triggers, :side, :integer, null: false, after: :order_type
    change_column :triggers, :order_id, :bigint, null: true
    change_column :triggers, :created_at, :datetime, limit: 3
    change_column :triggers, :updated_at, :datetime, limit: 3
    remove_column :triggers, :value
    add_index :triggers, :member_id
    add_index :triggers, :side
    add_index :triggers, %i[order_type member_id]
    add_index :triggers, %i[order_type market_id]
    add_index :triggers, %i[state side member_id]
    add_index :triggers, %i[state side market_id]
  end

  def down
    remove_column :triggers, :member_id
    remove_column :triggers, :market_id
    remove_column :triggers, :trigger_price
    remove_column :triggers, :amount
    remove_column :triggers, :execution_price
    remove_column :triggers, :locked
    remove_column :triggers, :side
    add_column :triggers, :value, :binary, limit: 128, null: false, after: :order_type
    remove_index :triggers, name: 'index_triggers_on_order_type_and_market_id'
    remove_index :triggers, name: 'index_triggers_on_order_type_and_member_id'
    remove_index :triggers, name: 'index_triggers_on_state_and_side_and_market_id'
    remove_index :triggers, name: 'index_triggers_on_state_and_side_and_member_id'
  end
end

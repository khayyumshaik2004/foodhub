-- Fix Paneer Tikka / Masala items that show the Dosa image (masala.jpg)
UPDATE menu SET item_name='Special Masala Dosa', description='Crispy South Indian crepe filled with spiced potato masala.' WHERE item_name='Paneer Tikka' AND restaurant_id=2;
UPDATE menu SET item_name='Punjabi Masala Dosa', description='A fusion dosa with a rich Punjabi spice twist.' WHERE item_name='Paneer Tikka Masala' AND restaurant_id=4;
UPDATE menu SET item_name='Crispy Masala Dosa', description='Classic crispy dosa served with sambar and chutney.' WHERE item_name='Punjabi Chole Masala' AND restaurant_id=9;

-- Fix Mutton Biryani showing Jeera Rice
UPDATE menu SET item_name='Aromatic Jeera Rice', description='Fragrant basmati rice cooked with cumin seeds and mild spices.' WHERE item_name='Mutton Biryani' AND restaurant_id=2;

-- Fix Tiramisu showing Chocolate
UPDATE menu SET item_name='Chocolate Fudge Brownie', description='Rich, warm chocolate brownie with a gooey center.' WHERE item_name='Tiramisu' AND restaurant_id=1;

-- Fix Onion Rings showing Nuggets
UPDATE menu SET item_name='Crispy Chicken Nuggets', description='Bite-sized, golden-fried chicken nuggets served with a dip.' WHERE item_name='Onion Rings' AND restaurant_id=3;
UPDATE menu SET item_name='Crispy Chicken Nuggets', description='Golden, crispy chicken nuggets.' WHERE item_name='Onion Rings' AND restaurant_id=10;

-- Fix Chicken Chettinad showing Butter Chicken
UPDATE menu SET item_name='South Indian Butter Chicken', description='A creamy and rich tomato-based chicken curry with a southern twist.' WHERE item_name='Chicken Chettinad' AND restaurant_id=5;

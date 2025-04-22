extends Label

@export var description: String = "placeholder description"
# Store the skill resource if needed later
var skill: SkillResource = null

func _ready():
	# Initial setup using the exported description if no resource set yet
	tooltip_text = description
	# Optionally, set initial text if needed
	# text = "Skill Name" 

func set_skill_resource(new_skill_resource: SkillResource):
	skill = new_skill_resource
	if skill:
		# Directly access properties assuming they exist based on skill_resource definition
		text = skill.name if skill.name else "Unnamed Skill"
		tooltip_text = skill.description if skill.description else ""
		description = tooltip_text # Update the exported variable too, if desired
	else:
		# Handle cases where the resource is null
		text = "N/A"
		tooltip_text = ""
		description = ""

# Optional: Update description if edited in the inspector after resource is set
func _set(property, value):
	if property == "description":
		description = value
		# If a resource is set, maybe update the tooltip, or decide priority
		if not skill: 
			tooltip_text = description
		return true # Indicate the property was handled
	return false # Let Godot handle other properties

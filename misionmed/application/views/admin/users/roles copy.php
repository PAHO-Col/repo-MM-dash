<?php 
/**
 * Roles view page.
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license 
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com> 
 * @package    Ushahidi - http://source.ushahididev.com
 * @module     Roles View
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
 */
?>
<div class="container my-4">
    <h2 class="mb-4">
        <?php admin::user_subtabs("roles", $display_roles); ?>
    </h2>

    <?php if ($form_error){ ?>
        <div class="alert alert-danger d-flex align-items-center">
            <i class="glyphicon glyphicon-remove me-2"></i>
            <div>
                <h5 class="mb-2"><?php echo Kohana::lang('ui_admin.error_msg');?></h5>
                <ul class="mb-0">
                    <?php foreach ($errors as $error_item => $error_description){ ?>
                        <?php if ($error_description){ ?>
                            <li><?php echo $error_description; ?></li>
                        <?php } ?>
                    <?php }; ?>
                </ul>
            </div>
        </div>
    <?php } ?>

    <?php if ($form_saved){ ?>
        <div class="alert alert-success d-flex align-items-center">
            <i class="glyphicon glyphicon-ok me-2"></i>
            <h5 class="mb-0"><?php echo $form_action; ?>!</h5>
        </div>
    <?php } ?>

    <div class="card mb-4">
        <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs">
                <li class="nav-item">
                    <a href="#" class="nav-link active" onclick="show_addedit(true)">
                        <?php echo Kohana::lang('ui_admin.header_add_edit'); ?>
                    </a>
                </li>
            </ul>
        </div>
        <div class="card-body" id="addedit" style="display: none;">
            <?php print form::open(NULL, array('id' => 'rolesMain','name' => 'rolesMain')); ?>
            <input type="hidden" name="action" id="action" value="a"/>
            <input type="hidden" id="role_id" name="role_id" value=""/>

            <div class="mb-3">
                <label class="form-label fw-bold"><?php echo Kohana::lang('ui_main.name');?>:</label>
                <?php print form::input('name', '', ' class="form-control"'); ?>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold"><?php echo Kohana::lang('ui_main.description');?>:</label>
                <?php print form::input('description', '', ' class="form-control"'); ?>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">
                    <?php echo Kohana::lang('ui_admin.access_level'); ?>
                    <a href="#" class="ms-1" title="<?php echo Kohana::lang("tooltips.settings_access_level"); ?>">
                        <i class="glyphicon glyphicon-info-sign"></i>
                    </a>
                </label>
                <?php print form::input('access_level','', ' class="form-control"'); ?>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold"><?php echo Kohana::lang('ui_admin.permissions'); ?>:</label>
                <div class="row">
                    <?php foreach ($permissions as $permission_id => $permission_name){ ?>
                        <div class="col-md-4 mb-2">
                            <div class="form-check">
                                <?php echo form::checkbox('permissions[]', $permission_id, FALSE, "id='permission_$permission_name' class='form-check-input'"); ?>
                                <?php echo form::label("permission_$permission_name", Kohana::lang('permissions.'.$permission_name), ['class' => 'form-check-label']); ?>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            </div>

            <div class="text-end">
                <button type="submit" class="btn btn-primary">
                    <i class="glyphicon glyphicon-floppy-disk"></i> <?php echo Kohana::lang('ui_admin.save_settings');?>
                </button>
            </div>

            <?php print form::close(); ?>
        </div>
    </div>

    <div class="table-responsive">
        <?php print form::open(NULL,array('id' => 'roleListing', 'name' => 'roleListing')); ?>
        <input type="hidden" name="action" id="role_action_main" value="">
        <input type="hidden" name="role_id" id="role_id_main" value="">

        <table class="table table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th></th>
                    <th><?php echo Kohana::lang('ui_admin.header_role'); ?></th>
                    <th></th>
                    <th><?php echo Kohana::lang('ui_admin.header_actions')?></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($roles as $role) 
                    {
                            $role_id = $role->id;
                            $name = $role->name;
                            $description = $role->description;
                            $access_level = $role->access_level;
                            $role_permissions = [];
                            foreach($role->permissions as $perm) {
                                $role_permissions[] = $perm->name;
                            }
                            ?>
                            <tr>
                                <td></td>
                                <td>
                                    <div>
                                        <strong class="text-uppercase"><?php echo utf8::strtoupper($name); ?></strong>
                                        <p class="mb-0 text-muted small"><?php echo $description; ?></p>
                                    </div>
                                </td>
                                <td></td>
                                <td>
                                    <?php 
                                    if (!in_array($role_id, [1,3,4]))
                                        { ?>
                                            <div class="btn-group" role="group">
                                            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="">  

                                                <i class="glyphicon glyphicon-pencil"></i> <?php echo Kohana::lang('ui_admin.edit_action');?>
                                            </button>
                                            <?php 
                                        }
                                    if (!in_array($role_id, [7,8])): ?>
                                        <button type="button" class="btn btn-sm btn-outline-danger" onclick="rolesAction('d','DELETE','<?php echo(rawurlencode($role_id)); ?>')">
                                            <i class="glyphicon glyphicon-trash"></i> <?php echo Kohana::lang('ui_admin.delete_action');?>
                                        </button>
                                    <?php else: ?>
                                        <span class="text-muted small"><?php echo Kohana::lang('ui_admin.default_role'); ?></span>
                                    <?php endif; ?>
                                </td>
                                </tr>
                            <?php 
                    } ?>
            </tbody>
        </table>
        <?php print form::close(); ?>
    </div>
</div>
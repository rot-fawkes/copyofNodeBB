<div class="row" id="navigation">
	<div class="col-lg-9">
		<div class="clearfix">
			<ul id="active-navigation" class="nav">
				{{{ each navigation }}}
				<li data-index="{navigation.index}" class="float-start nav-item {navigation.class} {{{ if navigation.selected }}} active {{{ end }}}">
					<a href="#" title="{navigation.route}" id="{navigation.id}" class="nav-link p-3 {{{ if !navigation.enabled }}}text-muted{{{ end }}}">
						<i class="nav-icon fa fa-fw {{{ if navigation.iconClass }}}{navigation.iconClass}{{{ end }}}"></i><i class="dropdown-icon fa fa-caret-down{{{ if !navigation.dropdown }}} hidden{{{ end }}}"></i>
					</a>
				</li>
				{{{ end }}}
			</ul>
		</div>

		<hr/>

		<ul id="enabled">
			{{{ each enabled }}}
			<li data-index="{enabled.index}" class="card card-body text-bg-light border-0 {{{ if !enabled.selected }}}hidden{{{ end }}}">
				<form>
					<div class="row">
						<div class="col-sm-12 text-end mb-3">
							{{{ if enabled.enabled }}}
							<button class="btn btn-warning toggle">[[admin/settings/navigation:btn.disable]]</button>
							{{{ else }}}
							<button class="btn btn-success toggle">[[admin/settings/navigation:btn.enable]]</button>
							{{{ end }}}
							<button class="btn btn-danger delete">[[admin/settings/navigation:btn.delete]]</button>
							<input type="hidden" name="enabled" value="{{{ if enabled.enabled }}}on{{{ end}}}" />
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-1">
							<label class="form-label">[[admin/settings/navigation:icon]]</label>
							<span class="iconPicker"><i class="fa fa-2x {enabled.iconClass}"></i>
								<a class="change-icon-link {{{ if enabled.iconClass }}}hidden{{{ end }}}" href="#">[[admin/settings/navigation:change-icon]]</a>
								<input class="form-control" type="hidden" name="iconClass" value="{enabled.iconClass}" />
							</span>
						</div>

						<div class="col-sm-3">
							<label class="form-label" for="nav:route">[[admin/settings/navigation:route]]</label>
							<input id="nav:route" class="form-control" type="text" name="route" value="{enabled.route}" />
						</div>

						<div class="col-sm-4">
							<label class="form-label" for="nav:class">[[admin/settings/navigation:class]]</label>
							<input id="nav:class" class="form-control" type="text" name="class" value="{enabled.class}" />
						</div>

						<div class="col-sm-4">
							<label class="form-label" for="nav:id">[[admin/settings/navigation:id]]</label>
							<input id="nav:id" class="form-control" type="text" name="id" value="{enabled.id}" />
						</div>
					</div>

					<div class="row mb-3">
						<div class="col-sm-4">
							<label class="form-label" for="nav:text">[[admin/settings/navigation:text]]</label>
							<input id="nav:text" class="form-control unescape" type="text" name="text" value="{enabled.text}" />
						</div>

						<div class="col-sm-4">
							<label class="form-label" for="nav:text-class">[[admin/settings/navigation:text-class]]</label>
							<input id="nav:text-class" class="form-control" type="text" name="textClass" value="{enabled.textClass}" />
						</div>

						<div class="col-sm-4">
							<label class="form-label" for="nav:tooltip">[[admin/settings/navigation:tooltip]]</label>
							<input id="nav:tooltip" class="form-control unescape" type="text" name="title" value="{enabled.title}" />
						</div>
					</div>

					<div class="row mb-3">
						<div class="col-12">
							<label class="form-label">[[admin/settings/navigation:groups]]</label>

							<select name="groups" class="form-select" size="10" multiple>
								{{{ each enabled.groups }}}
								<option value="{enabled.groups.displayName}"{{{ if enabled.groups.selected }}} selected{{{ end }}}>{enabled.groups.displayName}</option>
								{{{ end }}}
							</select>
						</div>
					</div>

					<div class="form-check form-switch mb-3">
						<input class="form-check-input" type="checkbox" name="targetBlank" {{{ if enabled.targetBlank }}}checked{{{ end }}}/>
						<label class="form-check-label">[[admin/settings/navigation:open-new-window]]</label>
					</div>

					<div class="form-check form-switch mb-3">
						<input class="form-check-input" type="checkbox" name="dropdown" {{{ if enabled.dropdown }}}checked{{{ end }}}/>
						<label class="form-check-label">[[admin/settings/navigation:dropdown]]</label>
					</div>
					<div>
						<p class="form-text">
							[[admin/settings/navigation:dropdown-placeholder]]
						</p>
						<textarea name="dropdownContent" rows="5" class="form-control">{enabled.dropdownContent}</textarea>
					</div>
				</form>
			</li>
			{{{ end }}}
		</ul>
	</div>

	<div class="col-lg-3">
		<div class="card">
			<div class="card-header">[[admin/settings/navigation:available-menu-items]]</div>
			<div class="card-body">
				<ul id="available">
					<li data-id="custom" class="clearfix">
						<div data-id="custom" class="drag-item alert alert-success float-start">
							<i class="fa fa-fw fa-plus-circle"></i>
						</div>
						<p>
							<strong>[[admin/settings/navigation:custom-route]]</strong>
						</p>
					</li>
					{{{ each available }}}
					<li data-id="{@index}" class="clearfix">
						<div data-id="{@index}" class="drag-item alert {{{ if available.core }}}alert-warning{{{ else }}}alert-info{{{ end }}} float-start">
							<i class="fa fa-fw {{{ if available.iconClass }}}{available.iconClass}{{{ else }}}fa-navicon{{{ end }}}"></i>
						</div>
						<p>
							<strong>{available.text}</strong> {available.route} <br/>
							{{{ if available.core }}} [[admin/settings/navigation:core]] {{{ else }}} [[admin/settings/navigation:plugin]] {{{ end }}}
						</p>
					</li>
					{{{ end }}}
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- IMPORT admin/partials/save_button.tpl -->
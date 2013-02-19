# spec/classes/jpackage_spec.rb

require 'spec_helper'

describe 'jpackage' do

  context 'when 6.0' do

    let(:params) do
      {:version => '6.0'}
    end

    let(:facts) do
      {:osfamily => 'RedHat'}
    end


    context 'when fedora' do

      let(:facts) do
        {:operatingsystem => 'Fedora',
          :os_maj_version => '17',
          :osfamily       => 'RedHat'}
      end

      it 'install jpackage-fc (disabled)' do
        should contain_yumrepo('jpackage-fc').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=fedora-17&type=free&release=6.0',
          'enabled'    => 0,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

      it 'does not install jpackage-fc-updates' do
        should_not contain_yumrepo('jpackage-fc-updates')
      end

    end

    context 'when redhat' do

      let(:facts) do
        {:operatingsystem => 'RedHat',
          :os_maj_version => '6',
          :osfamily       => 'RedHat'}
      end

      it 'install jpackage-rhel (disabled)' do
        should contain_yumrepo('jpackage-rhel').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=redhat-el-6&type=free&release=6.0',
          'enabled'    => 0,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

      it 'does not install jpackage-rhel-updates' do
        should_not contain_yumrepo('jpackage-rhel-updates')
      end

    end

    context 'when other (here CentOS)' do

      let(:facts) do
        {:operatingsystem => 'CentOS',
          :osfamily       => 'RedHat',
          :os_maj_version  => '6'}
      end

      it 'install jpackage-generic (enabled)' do
        should contain_yumrepo('jpackage-generic').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=6.0',
          'enabled'    => 1,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

      it 'does not install jpackage-generic-updates' do
        should_not contain_yumrepo('jpackage-generic-updates')
      end
    end


  end

  context 'when 5.0' do

    let(:params) do
      {:version => '5.0'}
    end

    let(:facts) do
      {:osfamily => 'RedHat'}
    end


    context 'when fedora' do

      let(:facts) do
        {:operatingsystem => 'Fedora',
          :osfamily       => 'RedHat',
          :os_maj_version  => '17'}
      end

      it 'install jpackage-fc (disabled)' do
        should contain_yumrepo('jpackage-fc').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=fedora-17&type=free&release=5.0',
          'enabled'    => 0,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

      it 'install jpackage-fc-updates (disabled)' do
        should contain_yumrepo('jpackage-fc-updates').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=fedora-17&type=free&release=5.0-updates',
          'enabled'    => 0,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

    end

    context 'when redhat' do

      let(:facts) do
        {:operatingsystem => 'RedHat',
          :osfamily       => 'RedHat',
          :os_maj_version  => '6'}
      end

      it 'install jpackage-rhel (disabled)' do
        should contain_yumrepo('jpackage-rhel').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=redhat-el-6&type=free&release=5.0',
          'enabled'    => 0,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

      it 'install jpackage-rhel-updates (disabled)' do
        should contain_yumrepo('jpackage-rhel-updates').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=redhat-el-6&type=free&release=5.0-updates',
          'enabled'    => 0,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

    end

    context 'when other (here CentOS)' do

      let(:facts) do
        {:operatingsystem => 'CentOS',
          :osfamily       => 'RedHat',
          :os_maj_version  => '6'}
      end

      it 'install jpackage-generic (enabled)' do
        should contain_yumrepo('jpackage-generic').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0',
          'enabled'    => 1,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end

      it 'install jpackage-generic-updates (enabled)' do
        should contain_yumrepo('jpackage-generic-updates').with({
          'mirrorlist' => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0-updates',
          'enabled'    => 1,
          'gpgcheck'   => 1,
          'gpgkey'     => 'http://www.jpackage.org/jpackage.asc',
        })
      end
    end


  end

end
